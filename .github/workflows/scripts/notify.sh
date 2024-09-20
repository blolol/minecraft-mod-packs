#!/usr/bin/env bash
# Notifies the #minecraft channel on irc.blolol.com about a mod pack release.

source ./.github/workflows/scripts/extract_pack_attributes.sh

release_tag="${GITHUB_REF_NAME#*/*/}"
release_url="$(gh release view "$release_tag" --json url | jq -r .url)"

from='Wheaties'
to='#minecraft'
message="⛏️✨ ${PACK_RELEASE_TITLE} is out! Release notes: ${release_url}"

accept_header='Accept: application/json'
authorization_header="Authorization: key=${BLOLOL_API_KEY} secret=${BLOLOL_API_SECRET}"
content_type_header='Content-Type: application/json'

base_url='https://api.blolol.com'
request_url="${base_url}/v1/chat/events"

request_body="$(jq -nc --arg from "$from" --arg to "$to" --arg message "$message" '{"event":{"type":"message","from":$from,"to":$to,"text":$message}}')"

curl "$request_url" \
  -H "$accept_header" \
  -H "$authorization_header" \
  -H "$content_type_header" \
  -d "$request_body"
