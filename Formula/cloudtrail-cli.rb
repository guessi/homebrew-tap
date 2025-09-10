class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.2.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "304528c10b5a73ec43551c82df5b3ec61af1c0fa7598f938d00e8b8e5d8fee9e"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.2.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "f8be75bdd852b08473859425d160097aa713101ba7ab32abfd366efa92f43b94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.2.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "08ea0114af229f2653d00337cbfe11fe0c94ecad6dafb20fc248b5b429fb8fc2"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.2.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "79da0cc5039c496d6169446b438f3f2019247e2939ae4013a7720a1c24a5039e"
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
