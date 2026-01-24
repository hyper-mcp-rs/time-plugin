# Time Plugin

A WebAssembly-based MCP plugin that provides time operations and utilities.

## Overview

This plugin provides various time-related operations including getting the current UTC time, parsing time strings, and calculating time offsets. It's designed to be used with the [hyper-mcp](https://github.com/hyper-mcp-rs/hyper-mcp) server.

Original source: https://github.com/dylibso/mcp.run-servlets/tree/main/servlets/time

## Features

- **Get Current UTC Time**: Retrieve the current time in UTC timezone
- **Parse Time**: Convert RFC2822 formatted time strings to timestamps
- **Time Offset**: Add or subtract time offsets from timestamps
- **Git-based Versioning**: Built with git-version for traceable builds

## Operations

### `get_time_utc`
Returns the current time in UTC timezone.

**Parameters**: None

**Returns**:
- `utc_time`: Unix timestamp (seconds since epoch)
- `utc_time_rfc2822`: RFC2822 formatted timestamp

### `parse_time`
Parses a time string in RFC2822 format and converts it to a timestamp.

**Parameters**:
- `time_rfc2822` (string): Time in RFC2822 format (e.g., "Mon, 23 Jan 2024 15:30:00 +0000")

**Returns**:
- `utc_time`: Unix timestamp
- `utc_time_rfc2822`: RFC2822 formatted timestamp

### `time_offset`
Adds a time offset to a given timestamp.

**Parameters**:
- `timestamp` (integer): Unix timestamp in seconds
- `offset` (integer): Offset in seconds (positive or negative)

**Returns**:
- `utc_time`: New timestamp after applying offset
- `utc_time_rfc2822`: RFC2822 formatted timestamp

## Usage

Use the plugin through the hyper-mcp server:

```json
{
  "name": "time",
  "arguments": {
    "name": "get_time_utc"
  }
}
```

```json
{
  "name": "time",
  "arguments": {
    "name": "parse_time",
    "time_rfc2822": "Mon, 23 Jan 2024 15:30:00 +0000"
  }
}
```

```json
{
  "name": "time",
  "arguments": {
    "name": "time_offset",
    "timestamp": 1706023800,
    "offset": 3600
  }
}
```

## Installation

### Using Docker Image

The plugin is available as a container image:

```bash
docker pull ghcr.io/[owner]/time-plugin:latest
```

For production use, pin to a specific version using the immutable digest (see release notes).

### From Source

1. Install Rust and the wasm32-wasip1 target:
```bash
rustup target add wasm32-wasip1
```

2. Build the plugin:
```bash
cargo build --release --target wasm32-wasip1
```

The compiled `.wasm` file will be in `target/wasm32-wasip1/release/plugin.wasm`.

## Versioning

This plugin uses git-based versioning via the `git-version` crate. The version information is embedded in the plugin description and can be viewed when the plugin is loaded.

Version format:
- Release builds: `v1.0.0` (when built from a git tag)
- Development builds: `v1.0.0-N-gHASH` (where N is commits since tag, HASH is commit)
- Modified builds: `v1.0.0-N-gHASH-modified` (when built with uncommitted changes)
- Fallback: `0.1.0` (from Cargo.toml if git info unavailable)

## Container Images

All container images are:
- Multi-architecture ready (though WASM is platform-independent)
- Signed with Cosign for security
- Available with both version tags and immutable digests

See the [releases page](../../releases) for verification instructions.

## Development

### Building Locally

```bash
cargo build --target wasm32-wasip1
```

### Building with Docker

```bash
docker build -t time-plugin .
```

Note: The Dockerfile includes the `.git` directory to enable git-version during builds.

### Running Tests

```bash
cargo test
```

## Security

- All container images are signed with [Sigstore Cosign](https://github.com/sigstore/cosign)
- Verification instructions are provided in each release
- Use immutable digests for production deployments

## License

Apache-2.0

## Contributing

Contributions are welcome! Please ensure:
- Code builds successfully for `wasm32-wasip1` target
- Git commits follow conventional commit format
- Version information is preserved (don't modify git-version setup)