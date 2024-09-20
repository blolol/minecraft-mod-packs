#!/usr/bin/env bash
# Sets environment variables describing a Blolol Minecraft mod pack.

naive_toml_value() {
  local toml_file="$1"
  local key="$2"
  awk -F '[=" ]' "/^${key} / { print \$5 }" "$toml_file"
}

pack_var() {
  local key="$1"
  naive_toml_value packs/$PACK_SLUG/pack.toml "$key"
}

PACK_BASE_NAME="${GITHUB_REF_NAME%%/*}" # e.g. "perkpack"
PACK_VERSION="${GITHUB_REF_NAME#*/}" # e.g. "4.0.1"
PACK_VERSION_MAJOR="${PACK_VERSION%%.*}" # e.g. "4"
PACK_SLUG="${PACK_BASE_NAME}-${PACK_VERSION_MAJOR}" # e.g. "perkpack-4"

PACK_NAME="$(pack_var name)" # e.g. "Perkpack"
PACK_RELEASE_TITLE="$PACK_NAME $PACK_VERSION" # e.g. "Perkpack 4.0.1"
PACK_MC_VERSION="$(pack_var minecraft)" # e.g. "1.21"

PACK_GH_BASE_URL="https://github.com/blolol/minecraft-mod-packs/tree/main/packs/${PACK_SLUG}"
PACK_GH_BASE_URL_RAW="https://raw.githubusercontent.com/blolol/minecraft-mod-packs/main/packs/${PACK_SLUG}"

PACK_README_URL="${PACK_GH_BASE_URL}#readme"
PACK_MC_WIKI_URL="https://minecraft.wiki/w/Java_Edition_${PACK_MC_VERSION}"
PACK_PRISM_DOWNLOAD_URL="${PACK_GH_BASE_URL_RAW}/prism-instance.zip"
PACK_PACKWIZ_METADATA_URL="${PACK_GH_BASE_URL_RAW}/pack.toml"

export PACK_BASE_NAME PACK_VERSION PACK_VERSION_MAJOR PACK_SLUG PACK_NAME PACK_MC_VERSION \
  PACK_RELEASE_TITLE PACK_GH_BASE_URL PACK_GH_BASE_URL_RAW PACK_README_URL PACK_MC_WIKI_URL \
  PACK_PRISM_DOWNLOAD_URL PACK_PACKWIZ_METADATA_URL
