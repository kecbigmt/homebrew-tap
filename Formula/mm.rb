class Mm < Formula
  desc "Personal knowledge management CLI"
  homepage "https://github.com/kecbigmt/mm"
  version "0.5.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/kecbigmt/mm/releases/download/v#{version}/mm-#{version}-darwin-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/kecbigmt/mm/releases/download/v#{version}/mm-#{version}-darwin-x64"
      sha256 "PLACEHOLDER"
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
