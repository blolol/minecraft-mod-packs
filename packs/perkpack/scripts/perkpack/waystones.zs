// Remove default Warp Stone recipe
craftingTable.removeByName("waystones:warp_stone");

// Replace it with a recipe that substitutes a Lodestone for the Emerald
craftingTable.addShaped(
  "expensive_warp_stone",
  <item:waystones:warp_stone>,
  [
    [<item:minecraft:amethyst_shard>, <item:minecraft:ender_pearl>, <item:minecraft:amethyst_shard>],
    [<item:minecraft:ender_pearl>, <item:minecraft:lodestone>, <item:minecraft:ender_pearl>],
    [<item:minecraft:amethyst_shard>, <item:minecraft:ender_pearl>, <item:minecraft:amethyst_shard>]
  ]
);
