#!/usr/bin/env node

/**
 * Update Homebrew formula with new version and checksum
 * Usage: node update_formula.js <version> <sha256> <formula_path>
 */

import fs from 'fs';
import { execSync } from 'child_process';

function updateFormula(version, sha256, formulaPath) {
  // Read formula file
  const content = fs.readFileSync(formulaPath, 'utf8');

  // Update version
  let updated = content.replace(/version ".*"/, `version "${version}"`);

  // Update sha256
  updated = updated.replace(/sha256 ".*"/, `sha256 "${sha256}"`);

  // Write back
  fs.writeFileSync(formulaPath, updated, 'utf8');

  console.log(`✓ Updated ${formulaPath}`);
  console.log('');
  console.log('=== Changes ===');

  // Show diff
  try {
    const diff = execSync(`git diff ${formulaPath}`, { encoding: 'utf8' });
    console.log(diff);
  } catch (error) {
    console.error('Could not show diff (git may not be available)');
  }
}

const [version, sha256, formulaPath = 'Casks/bodhi.rb'] = process.argv.slice(2);

if (!version || !sha256) {
  console.error('Usage: node update_formula.js <version> <sha256> [formula_path]');
  process.exit(2);
}

try {
  updateFormula(version, sha256, formulaPath);
} catch (error) {
  console.error('Error updating formula:', error.message);
  process.exit(1);
}
