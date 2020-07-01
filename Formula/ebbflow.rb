class Ebbflow < Formula
  desc "Client for using Ebbflow"
  homepage "https://github.com/ebbflow-io/ebbflow"
  url "https://github.com/ebbflow-io/ebbflow/releases/download/0.9.0/ebbflow_0.9.0_macos.zip"
  sha256 "51d69ed2d60392ae6f310fc3c04c9ad65595af6dad0345e3928a43d710f072bc"
  version "0.9.0"

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

