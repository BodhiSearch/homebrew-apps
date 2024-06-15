cask "bodhi" do
  version "0.0.10"
  sha256 "ed437bd71c42c6bb1b15a73036f780bc4f4c4c966631587c2fecb5e81e6463d9"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.10/Bodhi_0.0.10_aarch64.dmg"
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
