#!/usr/bin/env node

/**
 * Compare two semantic versions
 * Usage: node compare_versions.js <current> <new>
 * Exit code: 0 if new > current, 1 otherwise
 */

function compareVersions(current, newVer) {
  const parse = (v) => v.split('.').map(Number);
  const [c1, c2, c3] = parse(current);
  const [n1, n2, n3] = parse(newVer);

  return n1 > c1 || (n1 === c1 && n2 > c2) || (n1 === c1 && n2 === c2 && n3 > c3);
}

const [current, newVer] = process.argv.slice(2);

if (!current || !newVer) {
  console.error('Usage: node compare_versions.js <current> <new>');
  process.exit(2);
}

process.exit(compareVersions(current, newVer) ? 0 : 1);
