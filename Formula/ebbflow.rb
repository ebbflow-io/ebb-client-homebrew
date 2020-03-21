class Ebbflow < Formula
  desc "Client for using Ebbflow"
  homepage "https://github.com/ebbflow-io/ebbflow"
  url "https://github.com/ebbflow-io/ebbflow/releases/download/0.4.1/ebbflow-mac.zip"
  sha256 "5605466bd7e7529d59a08b4fb061779a9cede38c5ca266e135a6bd2005a8989f"
  version "0.4.1"

  def install
    bin.install "ebbflow"
  end
end

