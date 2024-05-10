cask "bodhi" do
  version "0.0.3"
  sha256 "181c8238a08af87f9523622ff1b955c381eda13cbc7b4a1cae1607fbea08b831"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.3/Bodhi_0.0.3_aarch64.dmg"
  name "bodhi"
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiApp"

  livecheck do
    url "https://github.com/BodhiSearch/BodhiApp/"
    strategy :github_latest
  end

  app "Bodhi"

  # binary "#{appdir}/Bodhi.app/Contents/Resources/resources/bin/bodhi"
end
