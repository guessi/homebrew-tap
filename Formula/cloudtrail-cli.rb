class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.6/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "7b5d8add04187358fd77cba7b7a2865c37bceb7cd67fb89623933403af5e0f77"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.6/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "07f63ca3d7bfe09dfce9f01b0a1fd7a0dd3b2f69a5e994c009038c2e69a89be0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.6/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "0c346440bc2d250a3033978f4c7aa475255f15a14f914933a9ade3d9b27903ef"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.6/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "b6c73d0949514ec75e8a767762b62943bff27771bcdc3c434a8ed044f7f7939c"
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
