class Netplotter < Formula
  desc "netplotter"
  homepage "https://github.com/alptekinsunnetci/netplotter"
  version "1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alptekinsunnetci/netplotter/releases/download/v1.0/netplotter-macos-arm64"
      sha256 "dd68e2355f01cf5f54e14332e13ec1687e71c2e3e45b83fe73d3a698d234e4db"
    else
      url "https://github.com/alptekinsunnetci/netplotter/releases/download/v1.0/netplotter-macos-amd64"
      sha256 "9ad2e28d12707d9b891ab30aafa4bc0b8c71d45c1a3037250884884ebd9b46a4"
    end
  end

  on_linux do
    url "https://github.com/alptekinsunnetci/netplotter/releases/download/v1.0/netplotter-linux-amd64"
    sha256 "b3a55fdfa7a46265ceb6690e51561c50a3a2be3c4d367b2b2f0aa2d6cf92eae9"
  end

  def install
    asset = Dir["netplotter-*"].first
    odie "Expected a netplotter-* asset in the build directory" if asset.nil?

    bin.install asset => "netplotter"
    chmod 0755, bin/"netplotter"
  end

  def caveats
    <<~EOS
      Windows: Homebrew formula does not support Windows installs.
      Please download netplotter-windows-amd64.exe from:
        https://github.com/alptekinsunnetci/netplotter/releases/tag/v1.0
    EOS
  end

  test do
    system "#{bin}/netplotter", "--help"
  end
end
