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
* Auto built weekly on Saturdays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://web.libera.chat/?channel=#demyx)
