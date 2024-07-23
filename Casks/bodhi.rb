cask "bodhi" do
  version "0.0.12"
  sha256 "bc757bca343ab01d20e39088203ec0d14f66ca78fcb13ec0982dd74076782722"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.12/Bodhi_0.0.12_aarch64.dmg"
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
      odie "This version is only for Apple Silicon (ARM) Macs. Your Mac is not supported."
    end
  end

  binary "#{appdir}/Bodhi.app/Contents/Resources/resources/bin/bodhi"
end
