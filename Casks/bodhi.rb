cask "bodhi" do
  version "0.0.3"
  sha256 "f9a31f4df9c76e06e6f859477051f79df6be1a214152a01d33bfaf5772bc0144"

  url "https://github.com/BodhiSearch/BodhiServer/releases/download/v0.0.3/Bodhi_0.0.3_aarch64.dmg"
  name "bodhi"
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiServer"

  livecheck do
    url "https://github.com/BodhiSearch/BodhiServer/"
    strategy :github_latest
  end

  app "Bodhi"

  binary "#{appdir}/Bodhi.app/Contents/Resources/resources/bin/bodhi"

  zap trash: ""
end
