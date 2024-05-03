class Bodhi < Formula
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiServer"
  url "/Users/runner/work/BodhiServer/BodhiServer/target/aarch64-apple-darwin/release/bundle/dmg/Bodhi_0.1.0_aarch64.dmg"
  sha256 "f29f93f9697908888c27dc49d32b48e75cdba7510a6d8dd45a0fa2444e680fb1"
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
