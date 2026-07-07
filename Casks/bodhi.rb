cask "bodhi" do
  version "0.0.55"
  sha256 "e5e087c88f75d6ae9a354ce09421ba8aa7c1afb0c04520183c6807e311a11db8"

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
