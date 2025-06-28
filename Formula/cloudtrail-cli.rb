class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.20"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.20/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "9b401cb3d21c617a4df5a1c2959b7bdfc63339a2a86532215d4c8079a2909459"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.20/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "a1823896ed41f834dcbc59ccf0e10aee79ec63f27f642c175e284ea541d39538"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.20/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "13cc3416376a9f55008180f9cb41deaa21b0826300bc6c5f5a80d64928b34c24"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.20/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "1f4dfd0cc870cf32eb2ef997789b8fb3801b8dfe1acb8f13d73c4b6e3c711397"
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
