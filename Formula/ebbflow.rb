class Ebbflow < Formula
  desc "Client for using Ebbflow"
  homepage "https://github.com/ebbflow-io/ebbflow"
  url "https://github.com/ebbflow-io/ebbflow/releases/download/0.4.1/ebbflow-mac.zip"
  sha256 "5605466bd7e7529d59a08b4fb061779a9cede38c5ca266e135a6bd2005a8989f"
  version "0.4.1"

  def install
    bin.install "ebbflow"
    sbin.install "ebbflowd"

    (etc/"ebbflow").mkpath # Config file loc
  end

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <true/>
        <key>Label</key>
        <string>EbbflowDaemon</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{sbin}/ebbflowd</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/ebbflowd.log</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/ebbflowd.log</string>
      </dict>
      </plist>
    EOS
  end
end

