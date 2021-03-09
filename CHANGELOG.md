# CHANGELOG

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
