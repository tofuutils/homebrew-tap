class Tofuenv < Formula
  desc "OpenTofu version manager inspired by tfenv"
  homepage "https://github.com/tofuutils/tofuenv"
  url "https://github.com/tofuutils/tofuenv/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "afb8e46c756b2921f0d95d02dee32ebdd7e5b26c466e8719add02bd25038c77c"
  license "MIT"
  head "https://github.com/tofuutils/tofuenv.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  uses_from_macos "unzip"

  on_macos do
    depends_on "grep"
    depends_on "jq"
  end

  conflicts_with "opentofu", because: "tofuenv symlinks opentofu binaries"

  def install
    prefix.install %w[bin lib libexec share]
  end

  test do
    assert_match "1.6.0-rc1", shell_output("#{bin}/tofuenv list-remote")
    with_env(TOFUENV_TOFU_VERSION: "1.6.0-rc1", TF_AUTO_INSTALL: "false") do
      assert_equal "1.6.0-rc1", shell_output("#{bin}/tofuenv version-name").strip
    end
  end
end
