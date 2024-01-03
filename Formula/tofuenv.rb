class Tofuenv < Formula
  desc "OpenTofu version manager inspired by tfenv"
  homepage "https://github.com/tofuutils/tofuenv"
  url "https://github.com/tofuutils/tofuenv/archive/refs/tags/v1.0.0.tar.gz"
  # sha256 "TODO"
  license "MIT"
  head "https://github.com/tofuutils/tofuenv.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

#   bottle do
#     sha256 cellar: :any_skip_relocation, all: "4905c2390b0254348be44da1c4a05b3d8bf4d8704b94d16b739d64fd4709784b"
#   end

  uses_from_macos "unzip"

  on_macos do
    depends_on "grep"
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
