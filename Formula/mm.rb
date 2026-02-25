class Mm < Formula
  desc "Personal knowledge management CLI with built-in MCP server"
  homepage "https://github.com/kecbigmt/mm"
  version "0.5.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/kecbigmt/mm/releases/download/v#{version}/mm-#{version}-darwin-arm64"
      sha256 "4066daaeb525334a53eafab62e1a3c4a9aa886d22dcfdc131ee65e449efe79ac"
    end
    on_intel do
      url "https://github.com/kecbigmt/mm/releases/download/v#{version}/mm-#{version}-darwin-x64"
      sha256 "7028f581036280f97bef5d763f1e41318fdd2452056d88b13460ca9bcc2a0f90"
    end
  end

  def install
    binary = Dir["mm-*"].first || "mm"
    mv binary, "mm" if binary != "mm"
    chmod 0755, "mm"
    bin.install "mm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mm --version")
  end
end
