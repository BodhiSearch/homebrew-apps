cask "bodhi" do
  version "0.0.8"
  sha256 "4d538f5be8a75b8867fa63d7a04402fd55076bd565630fc67f4dfc3dbacc64b3"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.8/Bodhi_0.0.8_aarch64.dmg"
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
