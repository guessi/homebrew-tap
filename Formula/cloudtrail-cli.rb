class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.1.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "3de4983e801c9d879bc06ac2880da77829d66706a6c896c36614e2cfc39496e4"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.1.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "163950e6770a46ccf38fd59156454cf082f1ada266ed72e5b95d78041f58e497"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.1.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "73c9cbdf3b599c6327a67108361783a2c24c69e0c5d3f99585baa7863bbc544a"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.1.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "f359abf9f80fa6605cf3e1c8b65a84a52a3b32cd052e1190f4afbf7b0895a364"
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
