//requires: tfc
//requires: sophisticatedbackpacks

ServerEvents.recipes(event => {
  // Unlike the other shaped backpack recipes, the netherite backpack's smithing table recipe
  // can't be disabled via Sophisticated Backpacks' mod config.
  event.remove({ output: 'sophisticatedbackpacks:netherite_backpack' })

  // Replace vanilla iron with wrought iron in all recipes
  event.replaceInput(
    { mod: 'sophisticatedbackpacks', input: '#c:ingots/iron' },
    '#c:ingots/iron',
    Ingredient.of('#c:ingots/wrought_iron')
  )
  event.replaceInput(
    { mod: 'sophisticatedbackpacks', input: '#c:storage_blocks/iron' },
    '#c:storage_blocks/iron',
    Ingredient.of('#c:storage_blocks/wrought_iron')
  )

  // Make crafting upgrade craftable using TFC workbenches
  event.replaceInput(
    { mod: 'sophisticatedbackpacks', input: 'minecraft:crafting_table' },
    'minecraft:crafting_table',
    Ingredient.of('#c:player_workstations/crafting_tables')
  )

  // Add custom recipes for feeding and tool swapper upgrades
  event.remove({ output: 'sophisticatedbackpacks:feeding_upgrade' })
  event.shaped(
    Item.of('sophisticatedbackpacks:feeding_upgrade', 1),
    [
      ' M ',
      'SBC',
      ' J '
    ],
    {
      B: 'sophisticatedbackpacks:upgrade_base',
      M: 'tfc:food/cooked_bear',
      S: '#c:foods/sandwiches',
      C: '#c:foods/soup',
      J: '#tfc:foods/sealed_preserves'
    }
  )

  event.remove({ output: 'sophisticatedbackpacks:tool_swapper_upgrade' })
  event.shaped(
    Item.of('sophisticatedbackpacks:tool_swapper_upgrade', 1),
    [
      'RJR',
      'PBA',
      'ISI'
    ],
    {
      R: 'minecraft:redstone',
      B: 'sophisticatedbackpacks:upgrade_base',
      I: '#c:ingots/wrought_iron',
      J: '#c:tools/spear',
      A: '#minecraft:axes',
      P: '#minecraft:pickaxes',
      S: '#minecraft:shovels'
    }
  )

  // Replace default base -> iron backpack upgrade recipe with wrought iron. Must be done manually
  // as a custom recipe due to the `sophisticatedbackpacks:backpack_upgrade` recipe type.
  // https://github.com/P3pp3rF1y/SophisticatedBackpacks/blob/1.21.x/src/generated/resources/data/sophisticatedbackpacks/recipe/iron_backpack.json
  event.remove({ id: 'sophisticatedbackpacks:iron_backpack' })
  event.custom({
    type: 'sophisticatedbackpacks:backpack_upgrade',
    category: 'misc',
    key: {
      'B': { item: 'sophisticatedbackpacks:backpack' },
      'I': { tag: 'c:ingots/wrought_iron' }
    },
    pattern: [
      'III',
      'IBI',
      'III'
    ],
    result: {
      id: 'sophisticatedbackpacks:iron_backpack',
      count: 1
    }
  })

  // Replace default copper -> iron backpack upgrade recipe with wrought iron. Must be done manually
  // as a custom recipe due to the `sophisticatedbackpacks:backpack_upgrade` recipe type.
  // https://github.com/P3pp3rF1y/SophisticatedBackpacks/blob/1.21.x/src/generated/resources/data/sophisticatedbackpacks/recipe/iron_backpack_from_copper.json
  event.remove({ id: 'sophisticatedbackpacks:iron_backpack_from_copper' })
  event.custom({
    type: 'sophisticatedbackpacks:backpack_upgrade',
    category: 'misc',
    key: {
      'B': { item: 'sophisticatedbackpacks:copper_backpack' },
      'I': { tag: 'c:ingots/wrought_iron' }
    },
    pattern: [
      ' I ',
      'IBI',
      ' I '
    ],
    result: {
      id: 'sophisticatedbackpacks:iron_backpack',
      count: 1
    }
  })
})
