class Bodhi < Formula
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiServer"
  url "https://github.com/BodhiSearch/BodhiServer/releases/download/0.0.10/Bodhi_0.1.0_aarch64.dmg"
  sha256 "9d82aa7bd60a6824fd503407fba2110a36b6916d08c8888fbf971b7e14889fdb"
  version "0.0.0"
  license "MIT"

  def install
    mount_dir = "/tmp/homebrew-mount"
    mount_cmd = "/usr/bin/hdiutil attach -readonly -nobrowse -mountpoint '#{mount_dir}' '#{staged_path}'"
    FileUtils.mkdir_p mount_dir
    system mount_cmd
    app = Dir.glob("#{mount_dir}/*.app").first
    prefix.install app
    FileUtils.rm_rf mount_dir

    bin_path = "#{prefix}/Bodhi.app/Contents/MacOS/Bodhi"
    wrapper = <<~EOS
      #!/bin/bash
      if [ $# -eq 0 ]; then
        args="--help"
      else
        args="$@"
      fi
      "#{bin_path}" $args
    EOS
    bin.mkpath
    (bin/"bodhi").write(wrapper)
    (bin/"bodhi").chmod 0755
  end

  def uninstall
    system "osascript -e 'quit app \"Bodhi\"'"
  end

  def zap
    trash = [
      "~/Library/Application Support/Bodhi",
      "~/Library/Preferences/com.bodhisearch.Bodhi.plist",
    ]
    trash.each { |file| File.delete(file) if File.exist?(file) }
  end
end
