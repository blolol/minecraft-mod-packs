<img src="images/perkpack-128.png" style="display: block; float: right">

# Perkpack 3

Perkpack is Blolol's Minecraft mod pack, used for blocky shenanigans on our Minecraft server!

## Versions

Perkpack bumps its major version number for each significant Minecraft update (e.g. from Minecraft 1.18 to 1.19).

| Perkpack Version     | Minecraft Version |
|----------------------|-------------------|
| Perkpack 3 (current) | Minecraft 1.19    |
| Perkpack 2           | Minecraft 1.18    |
| Perkpack 1           | Minecraft 1.17    |

As described in ["How to play"](#how-to-play), below, the mod pack automatically keeps itself up to date once you've installed it. However, if you're interested in the changes between versions, you can find release notes here: https://github.com/blolol/minecraft-mod-packs/releases

Mod pack updates are also announced by Wheaties in the `#minecraft` channels of [Blolol's IRC and Discord servers](https://blolol.com/chat).

## How to play

Playing Perkpack is pretty simple stuff. You'll only need to install the mod pack once per significant Minecraft update (e.g. from Minecraft 1.18 to 1.19). It will otherwise automatically keep itself up to date.

1. Install [Java 17](https://prismlauncher.org/wiki/getting-started/installing-java/).
1. Install [Prism Launcher](https://prismlauncher.org).
1. Click "Add Instance", then "Import from zip", give the instance a name like "Perkpack 3", then paste in this URL: https://s3.amazonaws.com/minecraft/mod-packs/perkpack/perkpack-prism-instance.zip
1. Once you're in-game, connect to `mc.blolol.com`.

## Mods

* [Create](https://modrinth.com/mod/create-fabric) — Automate your world with mechanical contraptions! And make honeyed apples.
* [EMI](https://modrinth.com/mod/emi) — The latest and greatest in-game recipe viewer.
* [WTHIT](https://modrinth.com/mod/wthit) — What the hell is that? Displays a tooltip at the top of your screen with useful information about whatever you're looking at.

## Development

You can use [Docker Compose](https://docs.docker.com/compose/) to set up a local development environment. The included `docker-compose.yml` will:

* Start an HTTP server on port 8082 that will serve up `pack.toml` and other packwiz files.
* Start a Minecraft game server on port 25565 (the game's default) using those local pack files.

To start both servers, run `docker-compose up` in this directory. Minecraft server data will be written into `tmp/server` and ignored by Git. The Docker Compose file includes defaults that will be written to `server.properties`. Once the file is generated, you can customize it.

To create a Prism Launcher instance that connects to your local HTTP server, import `prism-instance.zip` to create a new instance. Right-click on the instance and select Edit > Settings > Custom commands. Change the pre-launch command to point at your local server:

```sh
"$INST_JAVA" -jar packwiz-installer-bootstrap.jar http://localhost:8082/pack.toml
```

To learn how to contribute your changes to Perkpack, see [this repository's main README](../../README.md).
