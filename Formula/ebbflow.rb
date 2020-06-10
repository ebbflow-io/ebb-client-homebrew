class Ebbflow < Formula
  desc "Client for using Ebbflow"
  homepage "https://github.com/ebbflow-io/ebbflow"
  url "https://github.com/ebbflow-io/ebbflow/releases/download/0.5.22/ebbflow_0.5.22_macos.zip"
  sha256 "c35f66f8c021db43dbf061f6b4f66c06f6af01cf56a10c9077ac14e04ae44033"
  version "0.5.22"

  def install
    bin.install "ebbflow"
    sbin.install "ebbflowd"

    (etc/"ebbflow").mkpath # Config file loc
  end

  def post_install
    ohai "📣 After upgrade, must manually restart the brew service, e.g. 'brew services restart ebbflow' (maybe with sudo!)"
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

