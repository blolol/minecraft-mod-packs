# Perkpack 4

This is the in-development Perkpack 4 mod pack preview, based on Minecraft 1.21 and the Fabric mod loader.

If you're coming from Perkpack 3 and haven't kept up with Minecraft news, you might want to peruse the major changes to the base game since 1.20.1:

* [1.20.5 "Armored Paws" update guide](https://minecraft.wiki/w/Java_Edition_guides/Armored_Paws)
* [1.21 "Tricky Trials" update guide](https://minecraft.wiki/w/Java_Edition_guides/Tricky_Trials)

## Versions

Perkpack bumps its major version number for each significant Minecraft update (e.g. from Minecraft 1.20 to 1.21).

| Perkpack Version     | Minecraft Version |
|----------------------|-------------------|
| [Perkpack 4](https://github.com/blolol/minecraft-mod-packs/tree/main/packs/perkpack-4#readme) (preview) | Minecraft 1.21 |
| [Perkpack 3](https://github.com/blolol/minecraft-mod-packs/tree/main/packs/perkpack#readme) (current) | Minecraft 1.20 |
| Perkpack 2           | Minecraft 1.18    |
| Perkpack 1           | Minecraft 1.17    |

As described in ["How to play"](#how-to-play), below, the mod pack automatically keeps itself up to date once you've installed it. If you're interested in the changes between versions, you can find release notes here: https://github.com/blolol/minecraft-mod-packs/releases

Mod pack updates are also announced by Wheaties in the `#minecraft` channels of [Blolol's IRC and Discord servers](https://blolol.com/chat).

## How to play

Playing the Perkpack 4 preview is, like Perkpack 3, pretty simple stuff. You'll only need to install the mod pack once. It will otherwise automatically keep itself up to date.

> [!IMPORTANT]
> **If you haven't yet played Minecraft 1.21, you'll probably need to install Java 21** in step one below. Perkpack 3 is based on Minecraft 1.20.1, which uses Java 17. In Minecraft [1.20.5](https://minecraft.wiki/w/Java_Edition_1.20.5), Mojang updated the game to require Java 21. Perkpack 4 is based on the latest major release as of summer 2024, Minecraft 1.21.
>
> Multiple versions of Java can coexist without a problem, but you'll need to either override the Perkpack 4 Prism instance's Java version (right-click > Edit > Settings > Java), or change your default Java version in Prism Launcher's global settings.

1. Install [Java 21](https://prismlauncher.org/wiki/getting-started/installing-java/).
1. Install [Prism Launcher](https://prismlauncher.org).
1. In Prism Launcher, click "Add Instance", then "Import".
1. Give the instance a name like "Perkpack 4 Preview", then paste in this URL: https://github.com/blolol/minecraft-mod-packs/raw/main/packs/perkpack-4/prism-instance.zip
1. Right-click the instance, select Edit > Settings > Java, and ensure the Java installation points to an installation of Java 21.
1. Once you're in-game, connect to `pp4.mc.blolol.dev`.

### Helpful tips

* In video settings, you can toggle "fullscreen" to "borderless", thanks to [Cubes Without Borders](https://modrinth.com/mod/cubes-without-borders).
* A couple of nice resource packs are included, but are disabled by default. You can enable whichever ones you want. The recommended load order is:
  * [Fast Better Grass](https://modrinth.com/resourcepack/fast-better-grass)
  * Default (built into the game)
  * Fabric Mods
  * [Dramatic Skys](https://modrinth.com/resourcepack/dramatic-skys)
  * [Motschen's Better Leaves](https://modrinth.com/resourcepack/better-leaves)
  * Bushy Leaves Compat (Motschen's Better Leaves compatibility for Nature's Spirit; you can safely ignore the version mismatch warning)
  * [Fresh Animations](https://modrinth.com/resourcepack/fresh-animations)
* Press <kbd>o</kbd> to choose a shader pack, and <kbd>k</kbd> to toggle them on and off.
* Press <kbd>c</kbd> and use your mouse wheel to zoom using the [Ok Zoomer](https://modrinth.com/mod/ok-zoomer) mod.
* Press <kbd>m</kbd> to open [Xaero's World Map](https://modrinth.com/mod/xaeros-world-map).
* [Xaero's Minimap](https://modrinth.com/mod/xaeros-minimap) is enabled by default, but there's no default keybind to toggle it on and off. You can assign one in the game's key bindings screen.

## Mods

### Quality of life

* [AmbientSounds](https://modrinth.com/mod/ambientsounds) (pleasing ambiance)
* [Cubes Without Borders](https://modrinth.com/mod/cubes-without-borders) (borderless fullscreen mode)
* [EMI](https://modrinth.com/mod/emi) (item and recipe viewer)
* [Horse Buff](https://modrinth.com/mod/horsebuff) (quality of life tweaks for horses)
* [Ok Zoomer](https://modrinth.com/mod/ok-zoomer) (use <kbd>c</kbd> and your mouse wheel to zoom)
* [Xaero's Minimap](https://modrinth.com/mod/xaeros-minimap) (minimap)
* [Xaero's World Map](https://modrinth.com/mod/xaeros-world-map) (use <kbd>m</kbd> to toggle the world map)

### Tools

* [Easy Emerald Tools & More](https://www.curseforge.com/minecraft/mc-mods/simple-emerald-tools-fabric) (sets of armor, tools and weapons between vanilla iron and diamond, and 3x3 mining tools)

### World generation

* [Dungeons and Taverns](https://modrinth.com/datapack/dungeons-and-taverns) (new structures)
* [Larger Ore Veins: Deluxe](https://modrinth.com/datapack/larger-ore-veins-deluxe) (ore veins are less common, but larger)
* [Lithosphere](https://modrinth.com/datapack/lithosphere) (cinematic terrain)
* [Nature's Spirit](https://modrinth.com/mod/natures-spirit) (new biomes)
* [Tidal Towns](https://modrinth.com/datapack/tidal-towns) (floating villages)

### Performance

* [Chunky](https://modrinth.com/plugin/chunky)
* [Concurrent Chunk Management Engine](https://modrinth.com/mod/c2me-fabric)
* [Distant Horizons](https://modrinth.com/mod/distanthorizons)
* [Entity Model Features](https://modrinth.com/mod/entity-model-features) (EMF)
* [Entity Culling](https://modrinth.com/mod/entityculling)
* [Entity Texture Features](https://modrinth.com/mod/entitytexturefeatures) (ETF)
* [FerriteCore](https://modrinth.com/mod/ferrite-core)
* [ImmediatelyFast](https://modrinth.com/mod/immediatelyfast)
* [Indium](https://modrinth.com/mod/indium)
* [Iris](https://modrinth.com/mod/iris)
* [Lithium](https://modrinth.com/mod/lithium)
* [Noisium](https://modrinth.com/mod/noisium)
* [Reese's Sodium Options](https://modrinth.com/mod/reeses-sodium-options)
* [Sodium Extra](https://modrinth.com/mod/sodium-extra)
* [Sodium](https://modrinth.com/mod/sodium)

## Development

Like Perkpack 3, Perkpack 4 is managed using [packwiz](https://github.com/packwiz/packwiz), so you can refer to `../perkpack/README.md` for further documentation.
