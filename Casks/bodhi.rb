cask "bodhi" do
  name "bodhi"
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiServer"
  url "https://github.com/BodhiSearch/BodhiServer/releases/download/0.0.10/Bodhi_0.1.0_aarch64.dmg"
  sha256 "9d82aa7bd60a6824fd503407fba2110a36b6916d08c8888fbf971b7e14889fdb"
  version "0.0.0"
  license "MIT"

  app "Bodhi"

  zap trash: [
    "~/Library/Application Support/Bodhi",
    "~/Library/Preferences/com.bodhisearch.Bodhi.plist",
  ]

end
