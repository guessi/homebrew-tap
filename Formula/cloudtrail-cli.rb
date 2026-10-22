class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.10.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "50ab13f043b7149eb55cdbb4bc2392bf3fddd1b7c027fae8e86db6b8e03ad557"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.10.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "876ca76bc91bbfdcb8ebad8e5241be122329b3621acea4a5e1d4dce2eccc7086"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.10.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "8371874d797376b84c3bd2330eb8f46e54e318be1a626efc13671c1d11b1e89f"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.10.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "801c142602a95da1a7d46e3a25728d91d0b8c062422beae2b5fb0caf4c14ebfc"
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
    assert_match "cloudtrail-cli version v#{version}", output
  end
end
