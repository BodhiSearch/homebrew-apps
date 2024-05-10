cask "bodhi" do
  version "0.0.4"
  sha256 "fd9bd5711ba7665a92f905d1b2d289ef28b181b309ac9598fa49aa7a16b3a836"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.4/Bodhi_0.0.4_aarch64.dmg"
  name "bodhi"
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiApp"

  livecheck do
    url "https://github.com/BodhiSearch/BodhiApp/"
    strategy :github_latest
  end

  app "Bodhi.app"

  binary "#{appdir}/Bodhi.app/Contents/Resources/resources/bin/bodhi"
end
