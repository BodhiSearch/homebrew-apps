cask "bodhi" do
  version "0.0.11"
  sha256 "fa5722d733718d457c4a75a3c6b1329356b4bc9dd2aebf4c2a48c72e5ec8fc19"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.11/Bodhi_0.0.11_aarch64.dmg"
  name "bodhi"
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiApp"

  livecheck do
    url "https://github.com/BodhiSearch/BodhiApp/"
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "Bodhi.app"

  preflight do
    unless Hardware::CPU.arm?
      odie "This version "0.0.11"
    end
  end

  binary "#{appdir}/Bodhi.app/Contents/Resources/resources/bin/bodhi"
end
