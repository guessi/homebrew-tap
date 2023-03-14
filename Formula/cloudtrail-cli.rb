class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.2/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "9fdf7fa72c2e842f9514605698a3a345f83f082b73d6a2be3586dc83e5885e80"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.2/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "040dda6287ee4bbc314e658b93c411799e7f317cb8a6e18bb1cc184432888bf6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.2/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "4cd06fd1e6fce5ba0a9cb82ef1ac88d3166db5a9485add6bbbc6f0f85a5179c8"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.2/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "5c3fe05dc8e8373431c937cf42983b00dd8a1f92acbcd29b5775293ae95b6800"
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
