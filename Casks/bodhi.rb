cask "bodhi" do
  version "0.0.7"
  sha256 "8d7bb0322331a131e00f45c608464038b54faf3bc0af73632fe5163dfd504056"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.7/Bodhi_0.0.7_aarch64.dmg"
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
