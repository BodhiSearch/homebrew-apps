cask "bodhi" do
  version "0.0.1"
  sha256 "9d82aa7bd60a6824fd503407fba2110a36b6916d08c8888fbf971b7e14889fdb"

  url "https://github.com/BodhiSearch/BodhiServer/releases/download/v#{version}/Bodhi_#{version}_aarch64.dmg"
  name "bodhi"
  desc "Bodhi is an app to run LLMs/GenAI models locally and access via OpenAI compatible API"
  homepage "https://github.com/BodhiSearch/BodhiServer"

  livecheck do
    url "https://github.com/BodhiSearch/BodhiServer"
    strategy :github_latest
  end

  app "Bodhi"

  binary "#{app_dir}/Bodhi.app/Contents/Resources/resources/bin/bodhi"

  zap trash: ""
end
