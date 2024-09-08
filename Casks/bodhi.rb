cask "bodhi" do
  version "0.0.15"
  sha256 "8e4b98766a743499b08ee92896db0cae8d296c5fb8393c8c1b7c19906918e228"

  url "https://github.com/BodhiSearch/BodhiApp/releases/download/v0.0.15/Bodhi_0.0.15_aarch64.dmg"
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
      odie "Bodhi only supports Apple Silicon (ARM) Macs. Your Mac is not supported."
    end
  end

  binary "#{appdir}/Bodhi.app/Contents/Resources/resources/bin/bodhi"
end
