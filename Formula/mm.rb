class Mm < Formula
  desc "Personal knowledge management CLI with built-in MCP server"
  homepage "https://github.com/kecbigmt/mm"
  version "0.5.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/kecbigmt/mm/releases/download/v#{version}/mm-#{version}-darwin-arm64"
      sha256 "2db3fedd258062dae1c4449359ad23852f3555d8bd3e470a312d57d0fb2c5fc8"
    end
    on_intel do
      url "https://github.com/kecbigmt/mm/releases/download/v#{version}/mm-#{version}-darwin-x64"
      sha256 "5620cf95b2bbfaae4801735b47b99bd99a896657fd2cba18d1f12c1506321506"
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
