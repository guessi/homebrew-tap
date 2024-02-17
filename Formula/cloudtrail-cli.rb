class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.10/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "f785e8c3863afa7e7a04c1b228e70a63c7a4505c4e78fa589439199481c1cfa1"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.10/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "c4017d5a9bfbb4abf3a7bcab0b669a3e2fa78f7eb697972c7fd4202e37bed0c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.10/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "9c3768200ec72617121750c32c62d4a07ddf2890c476682075c80cc85f78fc63"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.10/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "fc1914d635e1a667df5c5ee658c51ccca33930fd5dd3f04316ebd4fe66d3faf3"
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
