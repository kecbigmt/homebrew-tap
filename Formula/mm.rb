class Mm < Formula
  desc "Personal knowledge management CLI with built-in MCP server"
  homepage "https://github.com/kecbigmt/mm"
  version "0.5.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/kecbigmt/mm/releases/download/v#{version}/mm-#{version}-darwin-arm64"
      sha256 "d9d541a9d920720b928da206e6dc349778ebff3ce84102b540389c01638e45e0"
    end
    on_intel do
      url "https://github.com/kecbigmt/mm/releases/download/v#{version}/mm-#{version}-darwin-x64"
      sha256 "ae22f37c2cc6b1230099257cec11092562212a59a9c723235caf6fa27f884cf6"
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
