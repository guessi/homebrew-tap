class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.6.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "0481994a37986c01a0f0d081b086b9c69ea776111bf422e4ddf790a9f9e0a35d"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.6.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "0cf75a228d797c6bac500ef6586907fe17395d5fffd2c6b420b016479f9b2065"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.6.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "bd5a5315eecabe2e21e6ab39c5bf52c01b4de84f9e53404a7e3a2fc068d9c236"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.6.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "324c2aa4b246d7a738d6bdee01f8f3875cdd233eec2925ec36777c1350bf6875"
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
