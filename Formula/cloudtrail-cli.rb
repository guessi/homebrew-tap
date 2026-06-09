class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.7.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "2f45d5d52a4bd415b55d6b59a1b98fc8b8dfc3b50847ecd37bff41ece1c87172"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.7.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "844c95fc169df0455e12d916acc3d97080686390d28f6453d38d74c95c5bb54e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.7.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "1674893415d9cd4c2e9a478f30645febd4843e3cec7b6fce7431a1458dbef250"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.7.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "995d5642757bcbdc6eaf3687c55a9b883eec6b00c4d7a10f56eb78a879ba5af5"
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
