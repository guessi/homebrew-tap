class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.3/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "5686302c2595996f359a0eb076c1e2a758cfe514b99c96a49ad8ceed2198870e"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.3/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "972c791c01edcd33d08233d720da559102008615a8ed5d96da9af6ef87307c68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.3/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "1808a3bfcc89311f10b62cb9331bb9d3be009c7b1de5aeca2d37e7e791a84107"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.3/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "fdce022173d0485d4112f4945e37b1e8d4a0da976438c319b296297c8e895736"
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
