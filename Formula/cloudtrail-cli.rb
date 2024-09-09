class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.14/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "7a9391c8ac0e460c30e12a9787ea0efeaa6fcb43c0acb9f67b6b62aea77a5901"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.14/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "1416fdfb19b67beebb4c014ed793aa6006ed118a7e6313b0bb10f8a26c8ccdf4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.14/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "2b431bae06613acc7633c6f8927869eda3bd9a11d8425298bf83efb30d835aac"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.14/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "fcd9dec8c3cfc0f5330f0ee2fca2028640c3d4b2bd2d9f72f16b765ef12d999a"
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
