# utilities
[![demyxsh/utilities](https://github.com/demyxsh/utilities/actions/workflows/main.yml/badge.svg)](https://github.com/demyxsh/utilities/actions/workflows/main.yml)
[![Code Size](https://img.shields.io/github/languages/code-size/demyxsh/utilities?style=flat&color=blue)](https://github.com/demyxsh/utilities)
[![Repository Size](https://img.shields.io/github/repo-size/demyxsh/utilities?style=flat&color=blue)](https://github.com/demyxsh/utilities)
[![Watches](https://img.shields.io/github/watchers/demyxsh/utilities?style=flat&color=blue)](https://github.com/demyxsh/utilities)
[![Stars](https://img.shields.io/github/stars/demyxsh/utilities?style=flat&color=blue)](https://github.com/demyxsh/utilities)
[![Forks](https://img.shields.io/github/forks/demyxsh/utilities?style=flat&color=blue)](https://github.com/demyxsh/utilities)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/utilities?style=flat&color=blue)](https://hub.docker.com/r/demyx/utilities)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/utilities)
[![Debian](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/utilities/raw/master/version.json&label=debian&query=$.debian&color=blue)](https://hub.docker.com/r/demyx/utilities)
[![Maldet](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/utilities/raw/master/version.json&label=maldet&query=$.maldet&color=blue)](https://hub.docker.com/r/demyx/utilities)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

To properly utilize this image, please use [Demyx](https://demyx.sh/readme).
- Repository - [demyxsh/demyx](https://github.com/demyxsh/demyx)
- Homepage - [demyx.sh](https://demyx.sh)

[![Demyx Discord](https://discordapp.com/api/guilds/1152828583446859818/widget.png?style=banner2)](https://demyx.sh/discord)

Join us on Discord for latest news, faster support, or just chill.

<a href="https://demyx.sh/sponsor-buymeacoffee" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

Support this project by buying coffee (please).

Packages |
------------- |
bash
jq
curl
ca-certificates
pv
pwgen
gpw
dnsutils
uuid-runtime
git
bsdmainutils
less
apache2-utils
dumb-init
nano
maldet
clamav
clamdscan

## NOTICE
This repository has been moved to the organization [demyxsh](https://github.com/demyxsh); please update the remote URL.
```
git remote set-url origin git@github.com:demyxsh/utilities.git
```

## Usage
Password generator
```
docker run -it --rm demyx/utilities sh -c "pwgen -cns 50 1"
# Output: K1awYls74a8q4vDRr58sAXXoXguuDSGsQf0BoIA2v7fU5P2sGn
```
Apache hash for Traefik basic auth
```
docker run -it --rm demyx/utilities sh -c "htpasswd -nb demyx 'password'"
# Output: demyx:$apr1$sooT67oI$dsxdbi6mLGL00XwdykaK10
```
Pronounceable-ish username generator for WordPress auto deployment
```
docker run -it --rm demyx/utilities sh -c "gpw 1 20"
# Output: tionsuistsmonplownse
```

## Updates & Support
- Auto built weekly on Saturdays (America/Los_Angeles)
- Rolling release updates
- For support: [Discord](https://demyx.sh/discord)
