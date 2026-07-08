cask "bodhi" do
  version "0.0.56"
  sha256 "88b7070257fbd4473d3aa41ddc7f3fbea94d1eea315cf8a59b6e5f0be9a71576"

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
