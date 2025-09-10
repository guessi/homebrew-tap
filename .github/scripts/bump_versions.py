#!/usr/bin/env python3

import hashlib
import re
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Dict, Optional, Tuple

import requests
from tqdm import tqdm

CHUNK_SIZE = 8192
MAX_WORKERS = 4
PLATFORMS = [
    ("Darwin-arm64", "arm"),
    ("Darwin-x86_64", "intel"),
    ("Linux-arm64", "arm"),
    ("Linux-x86_64", "intel")
]


def get_latest_release(repo: str) -> Optional[str]:
    print(f"  → Fetching latest release for {repo}")
    url = f"https://api.github.com/repos/{repo}/releases/latest"

    try:
        response = requests.get(url, timeout=30)
        response.raise_for_status()
        version = response.json()["tag_name"].lstrip("v")
        print(f"  → Latest version: {version}")
        return version
    except requests.RequestException as e:
        print(f"  → Error fetching release: {e}")
        return None


def get_sha256(url: str) -> Tuple[str, Optional[str]]:
    filename = url.split('/')[-1]

    try:
        response = requests.get(url, stream=True, timeout=30)
        response.raise_for_status()

        total_size = int(response.headers.get('content-length', 0))
        hash_sha256 = hashlib.sha256()

        with tqdm(total=total_size, unit='B', unit_scale=True,
                  desc=f"    {filename}") as pbar:
            for chunk in response.iter_content(chunk_size=CHUNK_SIZE):
                hash_sha256.update(chunk)
                pbar.update(len(chunk))

        return filename, hash_sha256.hexdigest()
    except requests.RequestException:
        return filename, None


def update_formula(formula_path: Path, repo: str, new_version: str) -> None:
    print(f"  → Updating formula file: {formula_path}")

    content = formula_path.read_text()

    print(f"  → Updating version to {new_version}")
    content = re.sub(r'version "[\d\.]+"', f'version "{new_version}"', content)

    repo_name = repo.split('/')[-1]
    urls = [
        (f"https://github.com/{repo}/releases/download/v{new_version}/"
         f"{repo_name}-{platform}.tar.gz", platform)
        for platform, _ in PLATFORMS
    ]

    print(f"  → Downloading {len(urls)} platform binaries in parallel")

    checksums = {}
    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
        future_to_platform = {
            executor.submit(get_sha256, url): platform
            for url, platform in urls
        }

        for future in as_completed(future_to_platform):
            platform = future_to_platform[future]
            filename, sha = future.result()
            if sha:
                checksums[platform] = sha
            else:
                print(f"    → {platform}: Failed")

    for platform in checksums:
        print(f"    → {platform}: {checksums[platform]}")

    for platform, _ in PLATFORMS:
        if platform in checksums:
            url_pattern = (f"https://github.com/{repo}/releases/download/"
                          f"v[\\d\\.]+/{repo_name}-{platform}.tar.gz")
            new_url = (f"https://github.com/{repo}/releases/download/"
                      f"v{new_version}/{repo_name}-{platform}.tar.gz")
            content = re.sub(url_pattern, new_url, content)

            sha_pattern = f'(url "{re.escape(new_url)}"\\s+sha256 ")[a-f0-9]{{64}}(")'
            sha_replacement = f'\\g<1>{checksums[platform]}\\g<2>'
            content = re.sub(sha_pattern, sha_replacement, content)

    formula_path.write_text(content)
    print("  → Formula file updated successfully")


def main() -> None:
    print("Starting formula version bump process...")

    formulas = {
        "Formula/eks-node-diagnostic.rb": "guessi/eks-node-diagnostic",
        "Formula/eks-ami-finder.rb": "guessi/eks-ami-finder",
        "Formula/eks-managed-node-groups.rb": "guessi/eks-managed-node-groups",
        "Formula/cloudtrail-cli.rb": "guessi/cloudtrail-cli"
    }

    print(f"Found {len(formulas)} formulas to check")

    for formula_file, repo in formulas.items():
        print(f"\n📦 Processing {repo}")
        print(f"  → Formula file: {formula_file}")

        latest_version = get_latest_release(repo)
        if not latest_version:
            print(f"  ❌ Could not get latest version for {repo}")
            continue

        formula_path = Path(formula_file)
        if not formula_path.exists():
            print(f"  ❌ Formula file not found: {formula_path}")
            continue

        print("  → Reading current formula")
        current_content = formula_path.read_text()

        current_version_match = re.search(r'version "([\d\.]+)"',
                                         current_content)
        if not current_version_match:
            print("  ❌ Could not find version in formula")
            continue

        current_ver = current_version_match.group(1)
        print(f"  → Current version: {current_ver}")

        if current_ver != latest_version:
            print(f"  → Version update needed: {current_ver} → "
                  f"{latest_version}")
            update_formula(formula_path, repo, latest_version)
            print(f"  ✅ Updated {repo}")
        else:
            print(f"  ✅ {repo} is already up to date "
                  f"(skipping checksum verification)")

    print("\n🎉 Formula version bump process completed!")


if __name__ == "__main__":
    main()
