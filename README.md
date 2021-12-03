# Blolol Minecraft Mod Packs

A collection of mod packs used on Blolol's Minecraft servers. Each subdirectory of `packs` contains mod files and metadata for a mod pack:

```
packs/
  mod-pack-foo/
    config/
      mod-1.cfg
      mod-2.json
    mods/
      mod-1.jar
      mod-2.jar
    options.txt
    pack.yml
  mod-pack-bar/
    config/
      mod-3.json
    mods/
      mod-1.jar
      mod-3.jar
      mod-4.jar
    resourcepacks/
      resource-pack-1.zip
    shaderpacks/
      shader-pack-1.zip
    options.txt
    pack.yml
```

In the above directory structure:

* The mod pack's name is its directory name.
* The `mods` directory contains mod Jar files.
* The `config`, `resourcepacks` and `shaderpacks` directories contain optional configuration files.
* `pack.yml` is a file that contains metadata about the mod pack, which version of Minecraft it supports, the mod loader platform to use, and which mods and other configuration files to include in the client and server packages.

## Versioning large files

This repository uses [Git Large File Storage](https://git-lfs.github.com) (LFS) to version JAR files. To install Git LFS, refer to [GitHub's documentation](https://docs.github.com/en/repositories/working-with-files/managing-large-files).

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
