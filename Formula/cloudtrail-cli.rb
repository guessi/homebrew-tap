class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.9.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "2ebdb711b230acc82071213c76f8c28afc1114688da68b7daa7b1252acf7d259"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.9.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "22118c43515b0bf0eda044f75bacff07f4e77ecc888222cff80ead3e58b3e99b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.9.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "70b12b8f603d67b3eb829bf6dcac62f83d80e3fe1e60538952f92f76d1937291"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.9.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "e52940675a3b9facc8f92ebbd49ffc6f57f1b906a4bef3cc095cdfc84a0ee6b3"
    end
  end

  def install
    bin.install "cloudtrail-cli"
  end

  def caveats
    <<~EOS
      cloudtrail-cli --help
    EOS
  end

  test do
    system "#{bin}/cloudtrail-cli", "--version"

    output = shell_output("#{bin}/cloudtrail-cli --version")
    assert_match "cloudtrail-cli version v#{version}", output
  end
end
