#!/bin/bash
# Demyx
# https://demyx.sh
# https://github.com/peter-evans/dockerhub-description/blob/master/entrypoint.sh
set -euo pipefail
IFS=$'\n\t'

# Get versions
DEMYX_UTILITIES_DEBIAN_VERSION=$(docker exec -t "$DEMYX_REPOSITORY" cat /etc/os-release | grep VERSION_ID | cut -c 12- | sed 's|"||g' | sed -e 's/\r//g')

# Replace versions
sed -i "s|debian-.*.-informational|debian-${DEMYX_UTILITIES_DEBIAN_VERSION}-informational|g" README.md

# Echo version to file
echo "DEMYX_UTILITIES_DEBIAN_VERSION=$DEMYX_UTILITIES_DEBIAN_VERSION
DEMYX_UTILITIES_VERSION=$(date +%Y-%m-%d)" > VERSION

# Push back to GitHub
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git remote set-url origin https://${DEMYX_GITHUB_TOKEN}@github.com/demyxco/"$DEMYX_REPOSITORY".git
# Commit VERSION first
git add VERSION
git commit -m "DEBIAN $DEMYX_UTILITIES_DEBIAN_VERSION"
git push origin HEAD:master
# Commit the rest
git add .
git commit -m "Travis Build $TRAVIS_BUILD_NUMBER"
git push origin HEAD:master

# Set the default path to README.md
README_FILEPATH="./README.md"

# Acquire a token for the Docker Hub API
echo "Acquiring token"
LOGIN_PAYLOAD="{\"username\": \"${DEMYX_USERNAME}\", \"password\": \"${DEMYX_PASSWORD}\"}"
TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d ${LOGIN_PAYLOAD} https://hub.docker.com/v2/users/login/ | jq -r .token)

# Send a PATCH request to update the description of the repository
echo "Sending PATCH request"
REPO_URL="https://hub.docker.com/v2/repositories/${DEMYX_USERNAME}/${DEMYX_REPOSITORY}/"
RESPONSE_CODE=$(curl -s --write-out %{response_code} --output /dev/null -H "Authorization: JWT ${TOKEN}" -X PATCH --data-urlencode full_description@${README_FILEPATH} ${REPO_URL})
echo "Received response code: $RESPONSE_CODE"

if [ $RESPONSE_CODE -eq 200 ]; then
  exit 0
else
  exit 1
fi
