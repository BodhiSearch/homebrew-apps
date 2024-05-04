cask "bodhi" do
  version "0.0.5"
  sha256 "dea16fbe5a2f5eb6195216c2d42aefdde4f514f0c53b4e2fd36e3a521005b0e1"

  url "https://github.com/BodhiSearch/BodhiServer/releases/download/v0.0.5/Bodhi_0.0.5_aarch64.dmg"
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
