cask "bodhi" do
  version "0.0.6"
  sha256 "85560d6549d58aefff43fd357a65860ab9084c5d0d33e2cc411a4e8494b0fe7c"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.6/Bodhi_0.0.6_aarch64.dmg"
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
