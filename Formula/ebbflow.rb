class Ebbflow < Formula
  desc "Client for using Ebbflow"
  homepage "https://github.com/ebbflow-io/ebbflow"
  url "https://github.com/ebbflow-io/ebbflow/releases/download/1.1.0/ebbflow_1.1.0_macos.zip"
  sha256 "495cc3f2e36fad3bf7c89983249bfabe727b8cad8ea4b459d6ffc3f88d00457c"
  version "1.1.0"

  def install
    bin.install "ebbflow"
    sbin.install "ebbflowd"

    (etc/"ebbflow").mkpath # Config file loc
  end

  def post_install
    ohai "📣 "
    ohai "📣 After upgrade, must manually restart the brew service, e.g. 'brew services restart ebbflow' (maybe with sudo!)"
    ohai "📣 "
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
        <string>#{etc}/ebbflow</string>
        <key>StandardOutPath</key>
        <string>#{etc}/ebbflow/ebbflowd.log</string>
        <key>StandardErrorPath</key>
        <string>#{etc}/ebbflow/ebbflowd.log</string>
      </dict>
      </plist>
    EOS
  end
end

