class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.19"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.19/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "83d7060bc565f2802ea394bae041963c370b0975c70b967f6a1c3bab0e292e8b"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.19/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "568f3c7990cab81320cdf9e909b118f4ca8693342aed430299480d3fa8b476e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.19/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "3ef283f82ca81b97a733bc30c2ef9c4ccf0001bc2adaef2e95637f837c395195"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.19/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "9f3440168b4167750458e05035e0cd1c3429ee57d29e6020d95f4ea08ad8e401"
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
