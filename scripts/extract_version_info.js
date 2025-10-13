#!/usr/bin/env node

/**
 * Extract version info from repository_dispatch payload or fetch from GitHub release
 * Usage: node extract_version_info.js <event_name> [payload_version] [payload_tag] [payload_sha256] [payload_url]
 */

import fs from 'fs';

async function main() {
  const [eventName, payloadVersion, payloadTag, payloadSha256, payloadUrl] = process.argv.slice(2);

  if (!eventName) {
    console.error('Usage: node extract_version_info.js <event_name> [payload_version] [payload_tag] [payload_sha256] [payload_url]');
    process.exit(1);
  }

  let newVersion, newTag, dmgSha256, dmgUrl;

  if (eventName === 'repository_dispatch') {
    newVersion = payloadVersion;
    newTag = payloadTag;
    dmgSha256 = payloadSha256;
    dmgUrl = payloadUrl;
  } else {
    // Manual trigger fallback: fetch from checksums.json
    newVersion = payloadVersion;
    newTag = payloadTag;
    console.log('Manual trigger - fetching checksums from GitHub release...');

    const checksumsUrl = `https://github.com/BodhiSearch/BodhiApp/releases/download/${newTag}/checksums.json`;
    const response = await fetch(checksumsUrl);

    if (!response.ok) {
      console.error(`Failed to fetch checksums.json: ${response.statusText}`);
      process.exit(1);
    }

    const checksums = await response.json();
    dmgSha256 = checksums.checksums['Bodhi_App.dmg']?.sha256;
    dmgUrl = checksums.checksums['Bodhi_App.dmg']?.url;
  }

  // Output to GitHub Actions
  const githubOutput = process.env.GITHUB_OUTPUT;
  if (githubOutput) {
    fs.appendFileSync(githubOutput, `new_version=${newVersion}\n`);
    fs.appendFileSync(githubOutput, `new_tag=${newTag}\n`);
    fs.appendFileSync(githubOutput, `dmg_sha256=${dmgSha256}\n`);
    fs.appendFileSync(githubOutput, `dmg_url=${dmgUrl}\n`);
  }

  // Log for debugging
  console.log(`New version: ${newVersion}`);
  console.log(`Release tag: ${newTag}`);
  console.log(`DMG URL: ${dmgUrl}`);
  console.log(`DMG SHA256: ${dmgSha256?.substring(0, 16)}...`);
}

main().catch((error) => {
  console.error('Error:', error.message);
  process.exit(1);
});
