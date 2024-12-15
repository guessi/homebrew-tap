class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.15/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "5b5af24e936825247b98815dd57649ae33593fc5e92931c740f1b7209ab1ad51"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.15/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "29da91d210ac48d02f9f99f68dd61fc3151865d35d613895e10869e882c04466"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.15/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "210b138f5c89eb39142d69a5cb86e7ce769d03517ef3c36008c5db6e4ce00af6"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.15/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "ecc348a018c3082626c4f7c275e0724076a15de0ab97cf37795ec6dabf2a04c8"
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
