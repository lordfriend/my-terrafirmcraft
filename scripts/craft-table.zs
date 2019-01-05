// techguns concrete
recipes.removeByRecipeName("techguns:concrete_0");
recipes.addShaped("techguns_concrete_0", <techguns:concrete:0> * 16, [
    [<immersiveengineering:stone_decoration:5>, <immersiveengineering:stone_decoration:5>, <immersiveengineering:stone_decoration:5>],
    [<immersiveengineering:stone_decoration:5>, <minecraft:iron_bars>, <immersiveengineering:stone_decoration:5>],
    [<immersiveengineering:stone_decoration:5>, <immersiveengineering:stone_decoration:5>, <immersiveengineering:stone_decoration:5>]]);

// techguns concrete stairs
recipes.addShaped("techguns_stairs_concrete_0", <techguns:stairs_concrete:7> * 4, [
    [null, null, <techguns:concrete:3>],
    [null, <techguns:concrete:3>, <techguns:concrete:3>],
    [<techguns:concrete:3>, <techguns:concrete:3>, <techguns:concrete:3>]
]);

recipes.addShaped("techguns_stairs_concrete_1", <techguns:stairs_concrete:15> * 4, [
    [null, null, <techguns:concrete:1>],
    [null, <techguns:concrete:1>, <techguns:concrete:1>],
    [<techguns:concrete:1>, <techguns:concrete:1>, <techguns:concrete:1>]
]);

// packed ice
recipes.addShaped("minecraft_packed_ice", <minecraft:packed_ice>, [
    [<minecraft:ice>, <minecraft:ice>, <minecraft:ice>],
    [<minecraft:ice>, <minecraft:ice>, <minecraft:ice>],
    [<minecraft:ice>, <minecraft:ice>, <minecraft:ice>]
]);

// remove techguns antigravypack
recipes.removeByRecipeName("techguns:antigravpack");

// remove structure arm steel recipes which conflicts with steel stairs.
// recipes.removeByRecipeName("immersiveengineering:metal_decoration/structural_arm_steel");

// add turret recipes which can use concrete from immersiveengineering
recipes.addShaped("techguns_turret", <techguns:basicmachine:3>, [
    [<ore:plateIron>, <ore:circuitBasic>, <ore:plateIron>],
    [<immersiveengineering:stone_decoration:5>, <techguns:itemshared:70>, <immersiveengineering:stone_decoration:5>],
    [<ore:plateIron>, <ore:dustRedstone>, <ore:plateIron>]
]);

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