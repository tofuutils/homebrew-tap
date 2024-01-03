class Tofuenv < Formula
  desc "OpenTofu version manager inspired by tfenv"
  homepage "https://github.com/tofuutils/tofuenv"

  url "https://github.com/tofuutils/tofuenv/archive/refs/tags/v1.0.0.tar.gz"
  version "1.0.0"
  # sha256 "TODO"
  license "MIT"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/quarkus" => "quarkus"
  end

  test do
    system "#{bin}/tofuenv", "help"
  end
end
