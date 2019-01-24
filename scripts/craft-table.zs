// packed ice
recipes.addShaped("minecraft_packed_ice", <minecraft:packed_ice>, [
    [<minecraft:ice>, <minecraft:ice>, <minecraft:ice>],
    [<minecraft:ice>, <minecraft:ice>, <minecraft:ice>],
    [<minecraft:ice>, <minecraft:ice>, <minecraft:ice>]
]);

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