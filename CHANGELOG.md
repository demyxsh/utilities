# CHANGELOG

## 2025-07-28
- Update commit message format in GitHub Actions workflow to include run ID [705d018](https://github.com/demyxsh/utilities/commit/705d018c97f0f27d08e640432bffcf15c939cbec)

## 2024-03-21
- Fix logic for port checking [2d92622](https://github.com/demyxsh/utilities/commit/2d92622494ea0db839318ceb99258fa5e400324b)

## 2024-01-18
- Add key to manually trigger workflow [cfcbb69](https://github.com/demyxsh/utilities/commit/cfcbb69e32190d910553fd3c481f576bf60a59af)

## 2022-01-22
- Define TERM to environment [a141c65](https://github.com/demyxsh/utilities/commit/a141c6530ae6744dd7420d2a247b2f3ee14d4ab9)

## 2021-03-08
- Added
    - `bin/demyx-chroot`
    - `bin/demyx-maldet`
    - `bin/demyx-port`
    - `bin/demyx-proxy`
    - `bin/demyx-table`
- Changed
    - Renamed src to bin.
    - Renamed chroot.sh to demyx-chroot.
    - Renamed maldet.sh to demyx-maldet.
    - Renamed port.sh to demyx-port.
    - Renamed proxy.sh to demyx-proxy.
    - Renamed table.sh to demyx-table.
    - `bin/demyx-maldet`
        - Remove if statement since all demyx containers uses the same structure.
        - Update variable.
    - `Dockerfile`
        - Update core variables with support for old ones.
        - Rearrange RUN commands.
        - Update bash PS1.
        - Update COPY directory.
        - Update finalize RUN command.
- Removed

## 2020-04-14
### Added
- Created src directory for main file(s)
### Changed
- Format LABEL and ENV entries
- Update finalize RUN commands
