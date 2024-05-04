cask "bodhi" do
  version "0.0.7"
  sha256 "eb98666969879ccc9042c7c012ca6e69a739e317cf8ea253da25370706b575a4"

  url "https://github.com/BodhiSearch/BodhiServer/releases/download/v0.0.7/Bodhi_0.0.7_aarch64.dmg"
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
