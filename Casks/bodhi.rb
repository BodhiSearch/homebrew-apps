cask "bodhi" do
  version "0.0.19"
  sha256 "5ec20ed6c1cb082d9278a33f88b0183d2ac7e41cffcab26e28b92f0fabfb78dd"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v#{version}/Bodhi.App_0.1.0_aarch64.dmg"
  name "bodhi"
  desc "Bodhi App allows you to run LLMs models locally and access result via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiApp"

  livecheck do
    url "https://github.com/BodhiSearch/BodhiApp"
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "Bodhi App.app"

  preflight do
    unless Hardware::CPU.arm?
      odie "Bodhi only supports Apple Silicon (ARM) Macs. Your Mac is not supported."
    end
  end

  binary "#{appdir}/Bodhi App.app/Contents/MacOS/bodhi"
end
