# Blolol Minecraft Mod Packs

A collection of mod packs used on Blolol's Minecraft servers.

Each subdirectory of `packs` contains a [packwiz](https://github.com/packwiz/packwiz) mod pack definition. packwiz is a command line tool for creating Minecraft mod packs.

## Building a mod pack

To build and release a mod pack version, simply push a tag named like `perkpack/1.0.0` to GitHub, where `perkpack` matches the name of a mod pack in the `packs` directory, and `1.0.0` is the mod pack version.

The GitHub Actions workflow defined in `.github/workflows/release.yml` will build versioned zip files, upload them to Amazon S3, and draft a GitHub release with links to the packages. You can then edit the release notes before publishing it.

If the version number in the tag contains "-pre", as in `perkpack/1.0.1-pre1`, the GitHub release will be marked as a prerelease.

### Manually building and releasing

In order to manually build and release a mod pack without GitHub Actions, you'll need:

* Ruby (see `.ruby-version` for the required version)
* AWS credentials, if you wish to upload the mod pack to Amazon S3. The credentials need these permissions:
  * `s3:GetObject`
  * `s3:ListBucket`
  * `s3:PutObject`
  * `s3:PutObjectAcl`

First, install Ruby dependencies using `bundle install`.

To build zip files of a mod pack, use `bundle exec rake 'build[MOD_PACK_NAME]'`. It will create versioned zip files in the `build` directory.

To upload the zip files to S3, use `bundle exec rake 'upload[MOD_PACK_NAME]'`.

## License

All rights of mod authors are reserved.
