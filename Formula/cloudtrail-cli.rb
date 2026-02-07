class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.4.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "6efe46f0fe092402a6a86037d9ed7767b78873c86718853900f9d1bdf6a42fbc"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.4.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "0d1d577725ddfb87f9d0434cf7ce80ed56a862b1f9bf9665b12a32c5baf31dd9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.4.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "5604dc972ff6c95b9d6f864de3c35ba76ecb04482803f42126c3195fd6bfda8f"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.4.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "4de1c5d8bc861bb5a99322e07972e2f465e7181f9d9fbb877ff06f486171c27a"
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
