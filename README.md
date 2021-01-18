# Blolol Minecraft Mod Packs

A collection of mod packs used on Blolol's Minecraft servers. Each subdirectory of `packs` contains mod files and basic metadata for a mod pack:

```
packs/
  mod-pack-foo/
    mods/
      mod-1.jar
      mod-2.jar
    VERSION
  mod-pack-bar/
    mods/
      mod-1.jar
      mod-3.jar
      mod-4.jar
    VERSION
```

In the above directory structure:

* The mod pack's name is its directory name.
* The `mods` directory contains mod Jar files.
* `VERSION` is a file that contains the mod pack version number (e.g. "1.16.4-v1.2").

## Building a mod pack

To build a zip file of a mod pack, use `bin/build MOD_PACK_NAME`. It will create a versioned zip file in the `build` directory.

## License

All rights of mod authors are reserved.
