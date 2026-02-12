# Changelog

## [0.3.0] - 2026-02-12

### Added

- Web search tool powered by Google Search grounding
- Support for gemini-3-flash-preview and gemini-3-pro-preview models

## [0.2.0] - 2026-02-07

### Fixed

- Fix Gemini 3 thought_signature error on function calls
- Preserve thought_signature from API response and include it when sending function call history back to the API
- Clear false-positive websocket-native LoadError from ExceptionCapture after loading ruby-gemini-api

## [0.1.1] - 2026-02-03

### Added

- GIRB_MODEL environment variable support

### Changed

- Recommend ~/.irbrc configuration instead of environment variables

## [0.1.0] - 2025-02-02

### Added

- Initial release
- Google Gemini LLM provider for girb
- Support for gemini-2.5-flash, gemini-2.5-pro, and other Gemini models
- Auto-configuration via GEMINI_API_KEY environment variable
- Function calling support
