class Bodhi < Formula
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiServer"
  url "https://github.com/BodhiSearch/BodhiServer/releases/download/app-v0.0.0/bodhi_0.0.0_aarch64.dmg"
  sha256 "bad1fbd0f8402281a37660cbb28bc57e58218c94b97e9847b20172ca5c96956c"
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

  uninstall quit: "com.bodhisearch.app"
  zap trash: [
    "~/Library/Application Support/com.bodhisearch.app",
    "~/Library/Preferences/com.bodhisearch.app.plist",
  ]
end
