class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.9/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "c8f25aa4b7cc4d23f256d8d7080f11c620524c66a67f2fed2edc5ad2051704f3"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.9/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "c647ca4f26efdcd1d2ac8d6f946371da849717e6c74fc64a04bab2398809faf3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.9/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "4a9b2d569657df7dff105133c06a17d74619ba5edfdcc3e63c1331a12c0e3adb"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.9/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "0a91e7aea77d04ad4c01fda3ed7548af4aba3cd6dc956dc114b0dee977fa1bb7"
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
