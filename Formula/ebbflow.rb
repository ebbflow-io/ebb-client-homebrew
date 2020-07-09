class Ebbflow < Formula
  desc "Client for using Ebbflow"
  homepage "https://github.com/ebbflow-io/ebbflow"
  url "https://github.com/ebbflow-io/ebbflow/releases/download/1.0.0/ebbflow_1.0.0_macos.zip"
  sha256 "5299cc44e321ec08b23d879fb946c15b52e468ddc7f6d28f89e013709abdb97e"
  version "1.0.0"

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

