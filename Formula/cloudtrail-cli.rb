class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.5/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "abb31776061e1323b4e119445282badeae715cce542dc3b5f71e6205e94f3101"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.5/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "7c023b97a7c9f3f31c843fb87fcc2e4d4dcf2fe90fa3155152b2b806fa8d147a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.5/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "11b1944d5f7686086d33abe14d5b06214920a9fff6edd6d3b2ab05e7bded6df7"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.5/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "b2d6ce25f70733f42a39f6ba07224ccb5ef8a16282346474ea1e483f4edfbae0"
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
