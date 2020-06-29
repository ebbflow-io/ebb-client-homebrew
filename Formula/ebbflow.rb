class Ebbflow < Formula
  desc "Client for using Ebbflow"
  homepage "https://github.com/ebbflow-io/ebbflow"
  url "https://github.com/ebbflow-io/ebbflow/releases/download/0.5.33/ebbflow_0.5.33_macos.zip"
  sha256 "db700ff3f920c60bd3dfa936729863f212c3601b06df59b6f98165d055bcd711"
  version "0.5.33"

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

