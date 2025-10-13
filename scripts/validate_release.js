#!/usr/bin/env node

/**
 * Validate DMG checksum and URL convention
 * Usage: node validate_release.js <version> <sha256> <url>
 */

function validateRelease(version, sha256, url) {
  // Validate checksum exists
  if (!sha256 || sha256 === 'null') {
    console.error('✗ Error: DMG checksum not provided');
    console.error('This likely means checksums.json was not found in the release');
    return false;
  }

  // Validate URL follows Homebrew convention
  const expectedUrl = `https://github.com/BodhiSearch/BodhiApp/releases/download/app/v${version}/Bodhi_App.dmg`;
  if (url !== expectedUrl) {
    console.error('✗ Error: DMG URL does not match expected convention');
    console.error(`  Expected: ${expectedUrl}`);
    console.error(`  Got:      ${url}`);
    console.error('This will cause Homebrew formula to break. Fix the URL in releases.json.');
    return false;
  }

  console.log(`✓ DMG SHA256 validated: ${sha256.substring(0, 16)}...`);
  console.log(`✓ DMG URL matches convention: ${url}`);
  return true;
}

const [version, sha256, url] = process.argv.slice(2);

if (!version || !sha256 || !url) {
  console.error('Usage: node validate_release.js <version> <sha256> <url>');
  process.exit(2);
}

const isValid = validateRelease(version, sha256, url);
process.exit(isValid ? 0 : 1);
