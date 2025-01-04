class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.16/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "c5668f7230733bf4e711f03a268d653c3878bc642020cca7b5c57751a16988a1"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.16/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "48475046907da73fae3fbdf6b0d377c6bf3c2c962961841412a8f2b84a3829ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.16/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "3da1a5854b83b8c6708aa1364b9c39a8260d83db5163725000686ee5846aec96"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.16/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "0b7a87bc097b537cb9b4b33ace7cb912ed8b3387ef839d8f24087ade0ec0b17c"
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
