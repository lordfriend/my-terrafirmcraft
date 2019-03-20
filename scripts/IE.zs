// add redstone veins

import mods.immersiveengineering.Excavator;
import mods.immersiveengineering.MineralMix;
import mods.immersiveengineering.Crusher;
import mods.immersiveengineering.BottlingMachine;

// mods.immersiveengineering.Excavator.addMineral("Redstone Ore", 100, 0, ["oreRedstone", "obsidian"], [0.8, 0.2]);

// var Redstone = Excavator.getMineral("Redstone Ore");

// Redstone.addOre("oreRedstone", 0.8);
// Redstone.addOre("obsidian", 0.2);

// print(Redstone.failChance);

// crusher
// mods.immersiveengineering.Crusher.addRecipe(<minecraft:clay_ball> * 4, <minecraft:clay>, 512);

// Add bottle machine recipes

mods.immersiveengineering.BottlingMachine.addRecipe(<vehicle:industrial_jerry_can>.withTag({fuel: 15000.0 as float}), <vehicle:industrial_jerry_can>, <liquid:gasoline> * 8000);
mods.immersiveengineering.BottlingMachine.addRecipe(<vehicle:jerry_can>.withTag({fuel: 5000.0 as float}), <vehicle:jerry_can>, <liquid:gasoline> * 5000);

// Tough as nails
// no longer used

// mods.immersiveengineering.BottlingMachine.addRecipe(<toughasnails:purified_water_bottle>, <minecraft:glass_bottle>, <liquid:dist_water> * 250);

// remove all bullets recipes

mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:bullet:2>);

// add new recipe for DragonBreath Bullet

mods.immersiveengineering.Blueprint.addRecipe("specialBullet", <immersiveengineering:bullet:2>.withTag({bullet: "dragonsbreath"}), [
    <immersiveengineering:bullet:1>, <grimoireofgaia:misc_soul_fire>*64, <grimoireofgaia:misc_soul_fiery>*32, <ore:dustAluminum>*64
]);

// add common bullets recipes
// casull
mods.immersiveengineering.Blueprint.addRecipe("bullet", <immersiveengineering:bullet:2>.withTag({bullet: "casull"}), [
    <immersiveengineering:bullet>, <ore:gunpowder>, <ore:nuggetLead>, <ore:nuggetLead>
]);
// AP
mods.immersiveengineering.Blueprint.addRecipe("bullet", <immersiveengineering:bullet:2>.withTag({bullet: "armor_piercing"}) , [
    <immersiveengineering:bullet>, <ore:gunpowder>, <ore:nuggetLead>, <ore:nuggetLead>
]);

mods.immersiveengineering.Blueprint.addRecipe("bullet", <immersiveengineering:bullet:2>.withTag({bullet: "buckshot"}), [
    <immersiveengineering:bullet>, <ore:gunpowder>, <ore:nuggetLead>, <ore:nuggetLead>
]);

mods.immersiveengineering.Blueprint.addRecipe("bullet", <immersiveengineering:bullet:2>.withTag({bullet: "he"}), [
    <immersiveengineering:bullet>, <ore:gunpowder>, <ore:nuggetLead>, <ore:nuggetLead>
]);

mods.immersiveengineering.Blueprint.addRecipe("bullet", <immersiveengineering:bullet:2>.withTag({bullet: "silver"}), [
    <immersiveengineering:bullet>, <ore:gunpowder>, <ore:nuggetLead>, <ore:nuggetLead>
]);

mods.immersiveengineering.Blueprint.addRecipe("specialBullet", <immersiveengineering:bullet:2>.withTag({bullet: "potion"}), [
    <immersiveengineering:bullet>, <ore:gunpowder>, <ore:nuggetLead>, <ore:nuggetLead>
]);

mods.immersiveengineering.Blueprint.addRecipe("specialBullet", <immersiveengineering:bullet:2>.withTag({bullet: "flare"}), [
    <immersiveengineering:bullet>, <ore:gunpowder>, <ore:nuggetLead>, <ore:nuggetLead>
]);

mods.immersiveengineering.Blueprint.addRecipe("specialBullet", <immersiveengineering:bullet:2>.withTag({flareColour: 16777090, bullet: "flare"}), [
    <immersiveengineering:bullet>, <ore:gunpowder>, <ore:nuggetLead>, <ore:nuggetLead>
]);

mods.immersiveengineering.Blueprint.addRecipe("specialBullet", <immersiveengineering:bullet:2>.withTag({flareColour: 2925323, bullet: "flare"}), [
    <immersiveengineering:bullet>, <ore:gunpowder>, <ore:nuggetLead>, <ore:nuggetLead>
]);