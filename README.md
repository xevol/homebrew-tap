# Xevol Homebrew Tap

Official Homebrew tap for Xevol tools.

## Installation

### Xevol CLI

#### Linux (x64)

```bash
brew tap xevol/tap
brew install xevol
```

After installation, you can use either `xevol` or `xvl` commands:

```bash
xevol --version
xvl --help
```

#### macOS / Other Platforms

For macOS and other platforms, use npm:

```bash
npm install -g xevol
```

## Available Formulas

- **xevol** - Command-line tool to consume, remix, make, publish, and offer systems, products, and workflows
  - Submit YouTube URLs for transcription
  - View and analyze transcriptions
  - Interactive TUI mode
  - Export transcriptions (JSON, markdown, text)
  - Workspace management
  - Stream analysis in real-time

## Platform Support

Currently, standalone binaries via Homebrew are only available for:
- Linux x86_64

For other platforms (macOS, Windows, ARM), please use the npm package.

## Development

To build macOS binaries, we need to compile on a macOS system:

```bash
cd ~/path/to/xevol-cli
bun build ./src/index.ts --compile --outfile xevol-macos-arm64
```

## License

See individual formula files for license information.
