cask "bodhi" do
  version "0.0.14"
  sha256 "09db11ffcc1627567c4cbdfca237c29917839397e785dcdf3adae935447d78b7"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.14/Bodhi_0.0.14_aarch64.dmg"
  name "bodhi"
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiApp"

  livecheck do
    url "https://github.com/BodhiSearch/BodhiApp/"
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "Bodhi.app"

  preflight do
    unless Hardware::CPU.arm?
      odie "Bodhi only supports Apple Silicon (ARM) Macs. Your Mac is not supported."
    end
  end

  binary "#{appdir}/Bodhi.app/Contents/Resources/resources/bin/bodhi"
end
