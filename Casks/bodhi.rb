cask "bodhi" do
  version "0.0.39"
  sha256 "b5338d0c94595708d9e57d3224e9086e8003bd6fd7578afcb1b437a4ec8d94ec"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/app/v#{version}/Bodhi_App.dmg"
  name "bodhi"
  desc "Bodhi App allows you to run LLMs models locally and access result via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiApp"

  livecheck do
    url "https://github.com/BodhiSearch/BodhiApp"
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "Bodhi App.app"

  preflight do
    unless Hardware::CPU.arm?
      odie "Bodhi only supports Apple Silicon (ARM) Macs. Your Mac is not supported."
    end
  end
end
