class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.5.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "4e195c7b218fafabcb7ffd7177f7583cb5fa5dafebacddde70b1b54d92e1ec43"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.5.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "c5f092a9a806bd847ccad2782469dc29e7e725dd95175ae82a3c09aee6b90f41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.5.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "fb391937c07e3b83ff0943424056671704e1c2169dc583b7912335bd383098ef"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.5.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "2482bc944b124c3e369224f537020efefc9a12fac0a802bc1b363751abf76bc3"
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
