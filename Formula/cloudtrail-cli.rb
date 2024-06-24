class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.12/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "1e86c83f94f8cbeb7338074379a621754030a71123c5c390d340ccbb7de119aa"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.12/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "43d1d6adac08892306f280d857e6fe97ae02d7e4ab615e1ed8c0d00dc92148e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.12/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "822677929aca2f109a2b948924d0d0084af65a383f5cb61ddd627462a9fae0b4"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.12/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "4ccb48f8a50d7926b1a4d15a31a83b948ee7537abd7eb6b0e3082848b20938e0"
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
