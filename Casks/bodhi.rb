cask "bodhi" do
  version "0.0.9"
  sha256 "924327c4f99d507179fafec744fa00de7246f3f378e1af87cb2649376b26ecb8"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.9/Bodhi_0.0.9_aarch64.dmg"
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
