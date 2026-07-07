cask "bodhi" do
  version "0.0.54"
  sha256 "7b2501e18e78d201d63948a5fe60206a7b9b8553bb7d647e79189279579c6cd6"

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
