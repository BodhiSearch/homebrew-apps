cask "bodhi" do
  version "0.0.9"
  sha256 "ed25a8beeff33a4ab24e7325d8f6feed872f9680299c503edaa4304a8c2e1cf0"

  url "https://github.com/BodhiSearch/BodhiServer/releases/download/v0.0.9/Bodhi_0.0.9_aarch64.dmg"
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
