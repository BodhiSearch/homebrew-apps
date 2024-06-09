cask "bodhi" do
  version "0.0.5"
  sha256 "23ca240d964c87213baa61dbd32644103da958f35a7457a66262e423eb7247c4"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.5/Bodhi_0.0.5_aarch64.dmg"
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
