cask "bodhi" do
  version "0.0.4"
  sha256 "ab2838dd882d6f2f1563ed0ed85a89d47a9c76203804d487b1e758e0c93b8686"

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
end
