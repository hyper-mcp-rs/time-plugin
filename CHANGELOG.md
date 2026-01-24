# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Git-based versioning using `git-version` crate
- Version information now embedded in plugin description
- Build script (`build.rs`) to track git changes during compilation
- Comprehensive README documentation with usage examples, versioning info, and security guidelines
- Git version display step in CI/CD workflows (both release and nightly)
- Comment in `.dockerignore` clarifying `.git` directory is intentionally included

### Changed
- Updated `Cargo.toml` to include `git-version = "0.3"` dependency
- Modified `src/lib.rs` to include VERSION constant using git-version macro
- Plugin description now includes version string: "Time operations plugin (version: {VERSION})"
- Updated `Dockerfile` to install git and copy `.git` directory for version tracking
- Enhanced release workflow to use single-platform builds with proper digest-based signing
- Enhanced nightly workflow to use single-platform builds with proper digest-based signing
- Improved GitHub release notes to include immutable digests for security
- Updated Cosign verification instructions to use digests instead of tags

### Fixed
- Container image signing now uses immutable digests instead of mutable tags
- Multi-platform builds removed in favor of single-platform (WASM is platform-independent)

## [0.1.0] - Initial Release

### Added
- Initial time plugin implementation
- Three operations: `get_time_utc`, `parse_time`, `time_offset`
- RFC2822 time format support
- Unix timestamp operations
- WebAssembly (wasm32-wasip1) compilation target
- Docker containerization
- GitHub Actions CI/CD workflows
- Cosign image signing support

[Unreleased]: https://github.com/[owner]/time-plugin/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/[owner]/time-plugin/releases/tag/v0.1.0