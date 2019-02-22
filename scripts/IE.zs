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

mods.immersiveengineering.BottlingMachine.addRecipe(<toughasnails:purified_water_bottle>, <minecraft:glass_bottle>, <liquid:dist_water> * 250);