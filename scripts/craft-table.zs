// packed ice
// recipes.addShaped("minecraft_packed_ice", <minecraft:packed_ice>, [
//    [<minecraft:ice>, <minecraft:ice>, <minecraft:ice>],
//    [<minecraft:ice>, <minecraft:ice>, <minecraft:ice>],
//    [<minecraft:ice>, <minecraft:ice>, <minecraft:ice>]
//]);

// remove structure arm steel recipes which conflicts with steel stairs.
// recipes.removeByRecipeName("immersiveengineering:metal_decoration/structural_arm_steel");

// remove the emerald satchels
recipes.removeByRecipeName("vanillasatchels:satchel_19");
recipes.removeByRecipeName("vanillasatchels:satchel_18");
recipes.removeByRecipeName("vanillasatchels:satchel_14");
recipes.removeByRecipeName("vanillasatchels:satchel_13");
recipes.removeByRecipeName("vanillasatchels:satchel_24");
recipes.removeByRecipeName("vanillasatchels:satchel_23");
recipes.removeByRecipeName("vanillasatchels:satchel_4");
recipes.removeByRecipeName("vanillasatchels:satchel_3");
recipes.removeByRecipeName("vanillasatchels:satchel_9");
recipes.removeByRecipeName("vanillasatchels:satchel_8");

// remove garden_cloche

recipes.removeByRecipeName("immersiveengineering:metal_devices/garden_cloche");

// remove Ink Cartridge of CFM mode

recipes.removeByRecipeName("cfm:item_ink_cartridge");

// remove all recipes for trinkets and baubles

recipes.removeByRecipeName("xat:dwarf_ring");
recipes.removeByRecipeName("xat:poison_stone");
recipes.removeByRecipeName("xat:fish_stone");
recipes.removeByRecipeName("xat:wither_ring");
recipes.removeByRecipeName("xat:small_ring");
recipes.removeByRecipeName("xat:glowing_ingot");
recipes.removeByRecipeName("xat:xat:rubber_stone");
// recipes.removeByRecipeName("xat:dragons_eye");
recipes.removeByRecipeName("xat:ender_tiara");
recipes.removeByRecipeName("xat:great_inertia_stone");
recipes.removeByRecipeName("xat:weightless_stone");
recipes.removeByRecipeName("xat:inertia_stone");
recipes.removeByRecipeName("xat:polarized_stone");
recipes.removeByRecipeName("xat:glow_ring");

// Add Ink Cartridge for printer

recipes.addShaped('printer_ink_cartridge', <cfm:item_ink_cartridge>,
  [[<ore:dyeBlack>,<ore:dyeBlack>,<ore:dyeBlack>],
  [<grimoireofgaia:misc_experience>,<grimoireofgaia:misc_experience:2>,<grimoireofgaia:misc_experience>],
  [<ore:dyeBlack>,<ore:dyeBlack>,<ore:dyeBlack>]]);
recipes.addShaped('printer_ink_cartridge_alt', <cfm:item_ink_cartridge>,
  [[<ore:dyeBlack>,<ore:dyeBlack>,<ore:dyeBlack>],
  [<grimoireofgaia:misc_experience:1>,<grimoireofgaia:misc_experience:1>,<grimoireofgaia:misc_experience:1>],
  [<ore:dyeBlack>,<ore:dyeBlack>,<ore:dyeBlack>]]);