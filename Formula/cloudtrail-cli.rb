class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.18/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "e35a3157ac765c4462ec1e639fcc3d8ba12f8a26c43791ca5011afcadb5b52a1"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.18/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "23650c833e63e8743aae8bb96e1790d0c313b6d89d9012aba3dde7569b01df1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.18/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "491776a3391530ea8daa23e7d57c03c9eb36be8d625f596fcd269c6a30034e24"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.18/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "1878987dd517b5d8e1e6fd4f7d11c9119eab5821da4580768d08d408370500a8"
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
    assert_match "cloudtrail-cli version", output
  end
end
