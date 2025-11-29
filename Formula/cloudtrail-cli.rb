class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.3.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "8df2371cc67436b159cb23ed7525a66451187279cc482c8f35aa27fcde73433f"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.3.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "71b6fc4048f1d2ef2133db0deae3c43aa208358d9d473db9f2fcab9ed1b131f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.3.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "1a716b9d3ced98ca1fea1049c8291da5e5ce6c3c99d7897d5e1dcca61413e6b0"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.3.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "3984e18c539180d998687c5eb2135716d0edaf647a263a01449f3f27c68fc005"
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
