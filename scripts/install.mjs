#!/usr/bin/env node
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import process from 'node:process';

const packageRoot = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const sourceSkill = path.join(packageRoot, 'image-prompt-builder');

const targetDefaults = {
  codex: path.join(process.env.CODEX_HOME || path.join(os.homedir(), '.codex'), 'skills'),
  claude: path.join(os.homedir(), '.claude', 'skills'),
  cursor: path.join(os.homedir(), '.cursor', 'skills'),
};

function usage() {
  console.log(`Image Prompt Builder installer

Usage:
  npx image-generator-prompt-builder --target codex
  npx image-generator-prompt-builder --target claude
  npx image-generator-prompt-builder --target cursor
  npx image-generator-prompt-builder --target all
  npx image-generator-prompt-builder --dir /custom/skills

Options:
  --target <codex|claude|cursor|all>  Install into a known local skills directory. Default: codex
  --dir <path>                       Install into a custom skills directory
  --force                            Replace an existing image-prompt-builder skill
  --help                             Show this help
`);
}

function parseArgs(argv) {
  const options = { target: 'codex', force: false, dir: null };
  for (let index = 0; index < argv.length; index += 1) {
    const arg = argv[index];
    if (arg === '--help' || arg === '-h') {
      options.help = true;
    } else if (arg === '--force') {
      options.force = true;
    } else if (arg === '--target') {
      options.target = argv[++index];
    } else if (arg.startsWith('--target=')) {
      options.target = arg.slice('--target='.length);
    } else if (arg === '--dir') {
      options.dir = argv[++index];
    } else if (arg.startsWith('--dir=')) {
      options.dir = arg.slice('--dir='.length);
    } else {
      throw new Error(`Unknown option: ${arg}`);
    }
  }
  return options;
}

function expandHome(inputPath) {
  if (!inputPath) return inputPath;
  if (inputPath === '~') return os.homedir();
  if (inputPath.startsWith('~/')) return path.join(os.homedir(), inputPath.slice(2));
  return inputPath;
}

function copyDirectory(source, destination) {
  if (!fs.existsSync(source)) {
    throw new Error(`Skill source not found: ${source}`);
  }
  fs.cpSync(source, destination, { recursive: true });
}

function installInto(skillsDir, force) {
  const expandedSkillsDir = path.resolve(expandHome(skillsDir));
  const destination = path.join(expandedSkillsDir, 'image-prompt-builder');

  fs.mkdirSync(expandedSkillsDir, { recursive: true });

  if (fs.existsSync(destination)) {
    if (!force) {
      throw new Error(`Already installed at ${destination}. Re-run with --force to replace it.`);
    }
    fs.rmSync(destination, { recursive: true, force: true });
  }

  copyDirectory(sourceSkill, destination);
  console.log(`Installed image-prompt-builder to ${destination}`);
}

try {
  const options = parseArgs(process.argv.slice(2));
  if (options.help) {
    usage();
    process.exit(0);
  }

  if (options.dir) {
    installInto(options.dir, options.force);
  } else if (options.target === 'all') {
    for (const dir of Object.values(targetDefaults)) {
      installInto(dir, options.force);
    }
  } else if (Object.hasOwn(targetDefaults, options.target)) {
    installInto(targetDefaults[options.target], options.force);
  } else {
    throw new Error(`Invalid target: ${options.target}. Use codex, claude, cursor, all, or --dir.`);
  }
} catch (error) {
  console.error(`Install failed: ${error.message}`);
  process.exit(1);
}
