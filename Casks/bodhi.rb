cask "bodhi" do
  version "0.0.1"
  sha256 "5a5bfd7832fa302a04cf78494dbccba87cf5d9169fe45cc63041cdc371693ad2"

  url "https://github.com/BodhiSearch/BodhiServer/releases/download/v0.0.1/Bodhi_0.0.1_aarch64.dmg"
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
