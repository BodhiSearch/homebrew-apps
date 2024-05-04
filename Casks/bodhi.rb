cask "bodhi" do
  version "0.0.8"
  sha256 "c619acbee3e8b5483f8a9a49a6a56059bcb3c2b1e6bce8615e70116c7aabe3fd"

  url "https://github.com/BodhiSearch/BodhiServer/releases/download/v0.0.8/Bodhi_0.0.8_aarch64.dmg"
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
