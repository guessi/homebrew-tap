#!/usr/bin/env bash

Formulas=$(find ./Formula -type f -name '*.rb' -print0 | xargs -0 -n 1 basename -s .rb)

for formula in ${Formulas[@]}; do
    FORMULA="./Formula/${formula}.rb"
    BASE_URL=$(awk -F'"' '/homepage/{print$2}' "${FORMULA}")
    VERSION=$(head -5 "${FORMULA}" | awk -F'"' '/version/{print$2}')
    echo "${formula} ${VERSION}"
    for os in Darwin Linux; do
        for arch in arm64 x86_64; do
            printf "  %s-%s - " "${os}" "${arch}"
            PACKAGE_URL="${BASE_URL}/releases/download/v${VERSION}/${formula}-${os}-${arch}.tar.gz"
            curl -fsSL "${PACKAGE_URL}" | sha256sum | awk '{print $1}'
        done
    done
    echo
done
