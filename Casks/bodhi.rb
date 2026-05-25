cask "bodhi" do
  version "0.0.52"
  sha256 "910b08a99505beca83205244ee1e3debfdff6acf7483ae7874523af911614354"

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
