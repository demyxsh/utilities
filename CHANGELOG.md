# Changelog

## 2026-05-08
### Added
- None.
### Changed
- Fixed maldet Docker build step by switching download to HTTPS.
- Added `curl` fail/retry flags to prevent incomplete tar extraction.
- Scheduled build run.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2025-07-28
### Added
- None.
### Changed
- Updated GitHub Actions workflow commit message format to include run ID.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2024-03-21
### Added
- None.
### Changed
- None.
### Fixed
- Fixed logic for port checking.
### Removed
- None.
### Security
- None.

## 2024-02-09
### Added
- None.
### Changed
- Updated description with support/project links.
- Upgraded base to Bullseye.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2024-01-18
### Added
- Added key to manually trigger workflow.
### Changed
- None.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2023-08-20
### Added
- None.
### Changed
- Switched to netcat for open-port checks.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2022-01-22
### Added
- None.
### Changed
- Defined `TERM` in environment.
- Migrated to GitHub Actions.
- Updated `jq` command.
- Passed `-t` flag.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2021-03-08
### Added
- Added `bin/demyx-chroot`.
- Added `bin/demyx-maldet`.
- Added `bin/demyx-port`.
- Added `bin/demyx-proxy`.
- Added `bin/demyx-table`.
### Changed
- Renamed `src` to `bin`.
- Renamed `chroot.sh` to `demyx-chroot`.
- Renamed `maldet.sh` to `demyx-maldet`.
- Renamed `port.sh` to `demyx-port`.
- Renamed `proxy.sh` to `demyx-proxy`.
- Renamed `table.sh` to `demyx-table`.
- Removed conditional check in `bin/demyx-maldet` due to unified container structure.
- Updated `bin/demyx-maldet` variable handling.
- Updated Dockerfile core variables with backward compatibility.
- Rearranged Dockerfile `RUN` commands.
- Updated bash `PS1`.
- Updated Dockerfile `COPY` directory.
- Updated final Dockerfile `RUN` command.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2020-04-14
### Added
- Created `src` directory for main files.
### Changed
- Formatted `LABEL` and `ENV` entries.
- Updated final `RUN` commands.
### Fixed
- None.
### Removed
- None.
### Security
- None.
