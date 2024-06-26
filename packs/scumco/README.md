# ScumCo

![ScumCo icon](images/scumco-server-icon-64.png)

Exploit a virtual world instead of the real one! **ScumCo** is a Minecraft mod pack about ruthlessly extracting resources from the innocent earth. Go ahead: humiliate the terrain. [Devastate the environment!](https://youtu.be/ZAtzN_ScKXY?t=148)

## Mods

* [Better Advancements](https://www.curseforge.com/minecraft/mc-mods/better-advancements) — Makes the advancements window (<kbd>L</kbd> key by default) use your entire screen, instead of a postage stamp-sized portion of it.
* [Chalk](https://www.curseforge.com/minecraft/mc-mods/chalk) — Mark your way through the world with chalk arrows!
* [Immersive Engineering](https://modrinth.com/mod/immersiveengineering) — Retro-futuristic tech. Build giant machines and wire them up to power sources in order to extricate every last useful material from the ground beneath your blocky feet.
* [Mouse Tweaks](https://modrinth.com/mod/mouse-tweaks) — Enhances inventory management by adding a few handy functions to your mouse buttons.
* [Moving Elevators](https://www.curseforge.com/minecraft/mc-mods/moving-elevators) — Move vertically in style.
* [Oculus](https://modrinth.com/mod/oculus) — Adds support for [shader packs](https://github.com/IrisShaders/Iris/blob/1.19.3/docs/supportedshaders.md). ScumCo comes with [Complementary Reimagined](https://www.complementary.dev/reimagined/) pre-installed, but disabled by default. To enable it, press <kbd>o</kbd> in-game to bring up the shader options screen.
* [Ok Zoomer](https://www.curseforge.com/minecraft/mc-mods/ok-zoomer-forge) — Press <kbd>C</kbd> to join Gen Z.
* [Quark](https://www.curseforge.com/minecraft/mc-mods/quark) and [Quark Oddities](https://www.curseforge.com/minecraft/mc-mods/quark-oddities) — Hundreds of small game tweaks and features. Check out [its feature list](https://quarkmod.net/#features) for full documentation!
* [Roughly Enough Items](https://modrinth.com/mod/roughly-enough-items) — A customizable item recipe browser.
* [Rubidium](https://modrinth.com/mod/rubidium) and [Starlight](https://modrinth.com/mod/starlight-forge) — Make Minecraft magically run faster.
* [Supplementaries](https://www.curseforge.com/minecraft/mc-mods/supplementaries) — A large selection of decorative and utility blocks and items, like [blackboards](https://github.com/MehVahdJukaar/Supplementaries/wiki/Decorative-Blocks#blackboard) and [block-rotating wrenches](https://github.com/MehVahdJukaar/Supplementaries/wiki/Tools,-Foods-and-Items#wrench). Check [its wiki](https://github.com/MehVahdJukaar/Supplementaries/wiki) for documentation.
* [Tom's Simple Storage](https://www.curseforge.com/minecraft/mc-mods/toms-storage) — Access your ineffable chest monster from one unified storage terminal!
* [WTHIT](https://modrinth.com/mod/wthit) — What the hell is that? Explains what you're looking at.

## How to play

1. Install [Java 17](https://prismlauncher.org/wiki/getting-started/installing-java/).
1. Install [Prism Launcher](https://prismlauncher.org).
1. Click "Add Instance", then "Import from zip", give the instance a name like "ScumCo", then paste in this URL: https://s3.amazonaws.com/minecraft/mod-packs/scumco/scumco-polymc-instance.zip
1. Once you're in-game, combine a [Lever](https://minecraft.fandom.com/wiki/Lever) and a [Book](https://minecraft.fandom.com/wiki/Book) to create Immersive Engineering's _Engineer's Manual,_ which will get you started on your road to fleecing nature of its precious lifeblood.

## Development

You can use [Docker Compose](https://docs.docker.com/compose/) to set up a local development environment. The included `docker-compose.yml` will:

* Start an HTTP server on port 8082 that will serve up `pack.toml` and other packwiz files.
* Start a Minecraft game server on port 25565 (the game's default) using those local pack files.

To start both servers, run `docker-compose up` in this directory. Minecraft server data will be written into `tmp/server` and ignored by Git. The Docker Compose file includes defaults that will be written to `server.properties`. Once the file is generated, you can customize it.

To create a Prism Launcher instance that connects to your local HTTP server, import `prism-instance.zip` to create a new instance. Right-click on the instance and select Edit > Settings > Custom commands. Change the pre-launch command to point at your local server:

```sh
"$INST_JAVA" -jar packwiz-installer-bootstrap.jar http://localhost:8082/pack.toml
```
