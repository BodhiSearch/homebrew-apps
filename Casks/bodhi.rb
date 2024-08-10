cask "bodhi" do
  version "0.0.13"
  sha256 "48f4ce516988e1bb302f55c9bee5e4984aaebd062f6371a52e239a49674f7a04"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.13/Bodhi_0.0.13_aarch64.dmg"
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
      odie "This version "0.0.13"
    end
  end

  binary "#{appdir}/Bodhi.app/Contents/Resources/resources/bin/bodhi"
end
