class Bodhiserver < Formula
  desc "Run GenerativeAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiServer"
  url "https://github.com/BodhiSearch/BodhiServer.git", tag: "v0.1.0", revision: "828442ca84e8dbff5c60a56add6f90241f2526a9"
  license "MIT"
  head "https://github.com/BodhiSearch/BodhiServer.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/bodhiserver"
  end

  service do
    run [opt_bin/"bodhiserver", "serve"]
    keep_alive true
    working_dir var
    log_path var/"log/bodhiserver.log"
    error_log_path var/"log/bodhiserver.log"
  end

  test do
    port = free_port
    ENV["BODHISERVER_PORT"] = "#{port}"
    pid = fork { exec "#{bin}/bodhiserver", "serve" }
    sleep 1
    begin
      assert_match "pong", shell_output("curl -s localhost:#{port}/ping")
    ensure
      Process.kill "SIGTERM", pid
    end
  end
end
