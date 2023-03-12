class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.1/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "dfcd49d916ae1beb76fd22db54fac293124e9a64a9d0cce9a2083bd82d31e293"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.1/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "3e75c818543e1015c85e483eccfa4c8214620c69fe7863b407e45bee4285749d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.1/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "ab6f308ca6a2acf5845b579591e95e7f4f4df56d107fb12830b8253871dbd71b"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.1/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "4a436878f8d916384af53609a74b52393a86adaede9307553dcc2971a5f7efbf"
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
