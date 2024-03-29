# Blolol Minecraft Mod Packs

A collection of mod packs used on Blolol's Minecraft servers.

## Creating a mod pack

Each subdirectory of `packs` contains a [packwiz](https://github.com/packwiz/packwiz) mod pack definition. packwiz is a command line tool for creating Minecraft mod packs.

To create a new mod pack, create a new subdirectory of `packs`, change directory into it, and run `packwiz init` per [packwiz's getting started guide](https://packwiz.infra.link/tutorials/creating/getting-started/). packwiz will prompt you for several details, like the pack's name, maintainer, version, and desired Minecraft and mod loader versions.

### Adding and updating mods

To add mods to the pack, use [packwiz's install commands](https://packwiz.infra.link/tutorials/creating/adding-mods/). For example, to add [Create Fabric](https://modrinth.com/mod/create-fabric) to a pack from [Modrinth](https://modrinth.com):

```sh
# Add the latest compatible version
packwiz mr add create-fabric # Search by mod name
packwiz mr add https://modrinth.com/mod/create-fabric # Or use its URL

# Add (or switch to) a specific version
packwiz mr add https://modrinth.com/mod/create-fabric/version/0.5.1-d-build.1161+mc1.20.1

# Update to the latest compatible version
packwiz update create-fabric

# packwiz also supports other Modrinth resources like resource and shader packs
packwiz add https://modrinth.com/shader/complementary-reimagined
```

## Releasing a mod pack

To build and release a mod pack version, push a tag named like `perkpack/1.0.0` to GitHub, where `perkpack` matches the name of a mod pack in the `packs` directory (the pack's "slug"), and `1.0.0` is the mod pack version.

The GitHub Actions workflow defined in `.github/workflows/release.yml` will draft a [release](https://github.com/blolol/minecraft-mod-packs/releases) on the GitHub repository, to which release notes should be added and published.

### Distributing a mod pack

You can [create a self-updating Prism Launcher instance](https://packwiz.infra.link/tutorials/installing/packwiz-installer/) using [packwiz-installer-bootstrap](https://github.com/packwiz/packwiz-installer-bootstrap) and a URL like https://github.com/blolol/minecraft-mod-packs/raw/perkpack/3/packs/perkpack/prism-instance.zip, where `perkpack/3` is the name of a release branch in this Git repository.

The default release notes generated by GitHub Actions will include a link to `https://github.com/blolol/minecraft-mod-packs/raw/$PACK_SLUG/$PACK_MAJOR_VERSION/packs/$PACK_SLUG/prism-instance.zip`. It's up to you to ensure that file exists in Git.

## License

The scripts and tools created for this repository are licensed under the MIT license. (See `LICENSE` for the full license text.) Minecraft, and the Minecraft mods referenced by, but not distributed with, the contents of this repository may be subject to different license terms.
