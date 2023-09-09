<img src="images/perkpack-256.png" style="display: block; float: right">

# Perkpack 3

Perkpack is Blolol's Minecraft mod pack, used for blocky shenanigans on our Minecraft server!

## Versions

Perkpack bumps its major version number for each significant Minecraft update (e.g. from Minecraft 1.18 to 1.19).

| Perkpack Version     | Minecraft Version |
|----------------------|-------------------|
| Perkpack 3 (current) | Minecraft 1.20    |
| Perkpack 2           | Minecraft 1.18    |
| Perkpack 1           | Minecraft 1.17    |

As described in ["How to play"](#how-to-play), below, the mod pack automatically keeps itself up to date once you've installed it. If you're interested in the changes between versions, you can find release notes here: https://github.com/blolol/minecraft-mod-packs/releases

Mod pack updates are also announced by Wheaties in the `#minecraft` channels of [Blolol's IRC and Discord servers](https://blolol.com/chat).

## How to play

Playing Perkpack is pretty simple stuff. You'll only need to install the mod pack once per significant Minecraft update (e.g. from Minecraft 1.19 to 1.20). It will otherwise automatically keep itself up to date.

1. Install [Java](https://prismlauncher.org/wiki/getting-started/installing-java/).
1. Install [Prism Launcher](https://prismlauncher.org).
1. In Prism Launcher, click "Add Instance", then "Import".
1. Give the instance a name like "Perkpack 3", then paste in this URL: https://s3.amazonaws.com/minecraft/mod-packs/perkpack/perkpack-prism-instance.zip
1. Once you're in-game, connect to `mc.blolol.com`.

![Creating a Prism Launcher instance](images/creating-a-prism-instance.png)

## Mods

### Create

Perkpack is built around [Create](https://modrinth.com/mod/create-fabric). Create adds a variety of blocks and tools with which you can build mechanical contraptions to automate and decorate your world—think conveyer belts, steam engines, mechanical presses, automated train networks, and much more. To get an idea of what's possible with Create, check out its trailer:

[![Watch "This is Create" on YouTube](images/create-mod-trailer-thumbnail.jpg)](https://www.youtube.com/watch?v=rR8W-f9YhYA)

Create features interactive, in-game documentation using a system called "Ponder". To try it out, open up your inventory and filter it to Create's blocks and items by typing `@create` into the search bar. Find a block or item with "Hold [w] to ponder" in its tooltip to view its animated tutorial:

![Pondering the Mechanical Press](images/create-mod-pondering.jpg)

There's also [a well-maintained wiki](https://create.fandom.com/wiki/Create_Mod_Wiki) and lots of educational Create content on YouTube!

### New content

## Development

You can use [Docker Compose](https://docs.docker.com/compose/) to set up a local development environment. The included `docker-compose.yml` will:

* Start an HTTP server on port 8082 that will serve up `pack.toml` and other packwiz files.
* Start a Minecraft game server on port 25565 (the game's default) using those local pack files.

To start both servers, run `docker compose up` in this directory. Minecraft server data will be written into `tmp/server` and ignored by Git. The Docker Compose file includes defaults that will be written to `server.properties`. Once the file is generated, you can customize it.

To create a Prism Launcher instance that connects to your local HTTP server, import `perkpack-prism-instance.zip` to create a new instance. Right-click on the instance and select Edit > Settings > Custom commands. Change the pre-launch command to point at your local server:

```sh
"$INST_JAVA" -jar packwiz-installer-bootstrap.jar http://localhost:8082/pack.toml
```

To learn how to contribute your changes to Perkpack, see [this repository's main README](../../README.md).
