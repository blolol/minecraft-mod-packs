#!/usr/bin/env bash
# Drafts a GitHub release for a Blolol Minecraft mod pack.

source ./.github/workflows/scripts/extract_pack_attributes.sh

cat <<EOS > $RUNNER_TEMP/pack_release_notes
This release of [${PACK_NAME}](${PACK_README_URL}) is for [Minecraft ${PACK_MC_VERSION}](${PACK_MC_WIKI_URL}).

## Changes

* Add release notes here!

## Packages

* **[Prism Launcher](https://prismlauncher.org) instance:** $PACK_PRISM_DOWNLOAD_URL
* **[packwiz](https://github.com/packwiz/packwiz) metadata:** $PACK_PACKWIZ_METADATA_URL
EOS

gh release create $GITHUB_REF_NAME --draft --title "$pack_release_title" \
  --notes-file $RUNNER_TEMP/pack_release_notes \
  $([[ $GITHUB_REF_NAME == */*-pre* ]] && echo -n '--prerelease')
