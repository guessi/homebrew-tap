class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.8/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "3f62ca67e165f15f2deb3de6b8dd6ae0d43bfb6094d0bddf3f611082f00d5d4b"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.8/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "bf6cf2f8e17a6aa94d01c6339da75f7be0c6de55b77c00bb363f7f26fd4884a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.8/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "a1e9695fa537b2d1e045d6f5036511f64846afdfbbc89cfb4a2e229ff9d1bd41"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.8/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "4115777e076e10b993ccba29d58b546ae3f5281616d834103f15f71a10bc3fc3"
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
