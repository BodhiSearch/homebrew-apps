cask "bodhi" do
  version "0.0.2"
  sha256 "ef882a1038ccc55673bee8269161a476b1e00844b7c1240bbead4477f27cebb0"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.2/Bodhi_0.0.2_aarch64.dmg"
  name "bodhi"
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiServer"

  livecheck do
    url "https://github.com/BodhiSearch/BodhiServer/"
    strategy :github_latest
  end

  app "Bodhi"

  binary "#{appdir}/Bodhi.app/Contents/Resources/resources/bin/bodhi"
end
