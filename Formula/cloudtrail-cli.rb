class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.7/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "6ed490c30e362122bdc1c53b5c75bf1342e112af790b3527e6d153587f37bf77"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.7/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "f828dec1202dc353d8e97e65b4d921961c8788f7c763d4d505f2a62b2c88a005"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.7/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "0c346440bc2d250a3033978f4c7aa475255f15a14f914933a9ade3d9b27903ef"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.7/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "2009200a2e3ca97012bd8ff2db8f6c98e488181f3f6fdeeb382d70e9f22a2da3"
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
