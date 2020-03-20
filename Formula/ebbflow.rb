class Ebbflow < Formula
  desc "Client for using Ebbflow"
  homepage "https://github.com/ebbflow-io/ebb-client"
  url "https://github.com/ebbflow-io/ebb-client/releases/download/0.4.0/ebbflow-mac.zip"
  sha256 "b177989abb5dcc615d8cdd429cec7526ef5f235eaac1621446847e663aadbb03"
  version "0.4.0"

  def install
    bin.install "ebbflow"
  end
end

