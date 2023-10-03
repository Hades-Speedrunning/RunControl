# Introduction

This document will explain how to write your own runs for the RunControl modpack. It is current as of version 1.0.0. I recommend some degree of coding experience to write your own runs, but the format does not require much knowledge of Lua.

# Modpack Structure

When your pack is installed, your Hades\\Content\\Mods\\ folder should contain these subfolders:

- BoonControl\\
- EncounterControl\\
- ErumiUILib\\
- ModUtil\\
- PrintUtil\\
- RCLib\\
- RemoveCutscenes\\
- RewardControl\\
- RoomControl\\
- RunControl\\
- SellControl\\
- ShopControl\\

Most of these are modules which control individual mechanics- you will never interact with them directly. The only folder you need to enter is RunControl\\ itself. That folder should look like this:

- DemoRuns\\
- Runs\\
- modfile.txt
- RunControl.lua
- RunControlMenu.lua

Again, these can largely be ignored. Runs\\ is where all the runs you create will be stored. To start making a run, open Runs\\, and create a new file named `ExampleRun.lua` (or whatever else you want to call it).

# Run Structure

Run files are defined in the form of a nested lua table, which you can then select ingame. Each file must start with this line:

```lua
RunControl.Runs.ExampleRun = {
```

This starts a Lua table and adds it to the modpack's index. The table can include a `Metadata` subtable, which looks like this:

```lua
RunControl.Runs.ExampleRun = {
    Metadata = {
        Name = "My Hades Run",
        Description = "This is a description!",
        OriginalTime = "06:09.69",
        OriginalHeat = 9,
        CreatedFor = "1.0.0",
    },
}
```

This is optional, but I'd recommend you at least give your run a name and write what version it was created for.

Whether you choose to include `Metadata` or not, what you *will* need are the subtables `IndexedBy` and `List`. `List` contains all of the run's data, while `IndexedBy` describes how it's sorted:

```lua
RunControl.Runs.ExampleRun = {
    IndexedBy = { "chamberNum", "dataType" },
    List = {
        [1] = {
            boonMenu = {
                Data = { ... },
            },
        },
    },
}
```

When an event occurs in-game, the modpack will start a search through your `List`, trying to find the `Data` it needs. In this case, our list is indexed by `chamberNum` and `dataType`. The `Data` would be found when `chamberNum` is `1` and the desired `dataType` is `boonMenu`, so this list would set any boon menu opened in chamber 1.

I would usually recommend indexing by `chamberNum`, `dataType`, and `rerollNum`.

```lua
RunControl.Runs.ExampleRun = {
    IndexedBy = { "chamberNum", "dataType", "rerollNum" },
    List = {
        [1] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "TidalDash" },
                    },
                },
            },
        },
    },
}
```

This would force Tidal Dash in chamber 1 boon menus with a reroll num of 1 (i.e., you have not rerolled yet).

You do not always have to index by everything you've defined in `IndexedBy`. If a mod finds `Data` early, it will stop the search then. This would force Epic Tidal Dash in every chamber 1 boon menu, regardless of reroll number:

```lua
RunControl.Runs.ExampleRun = {
    IndexedBy = { "chamberNum", "dataType", "rerollNum" },
    List = {
        [1] = {
            boonMenu = {
                Data = {
                    { Name = "TidalDash" },
                },
            },
        },
    },
}
```

You can also be more specific for certain cases by putting another list inside your list. This would force Tidal Dash in chamber 1 boon menus, but only if they are Poseidon:

```lua
RunControl.Runs.ExampleRun = {
    IndexedBy = { "chamberNum", "dataType", "rerollNum" },
    List = {
        [1] = {
            boonMenu = {
                IndexedBy = { "godName" },
                List = {
                    Poseidon = {
                        Data = {
                            { Name = "TidalDash" },
                        },
                    },
                },
            },
        },
    },
}
```

Note that since you changed `IndexedBy` partway through, `rerollNum` will now be ignored.

A full list of the possible data types, as well as how each one should look, can be found below.

**NOTE**: In order for a `Data` table to used, you must have indexed by `dataType`, or the pack won't know what to use it for.

When you've finished your run, you can check it by copy-pasting it into [glualint](https://fptje.github.io/glualint-web/). Then, put it in your Mods\\RunControl\\Runs folder, re-run modimporter, and it should appear ingame.  
If the run still crashes or doesn't work properly, check the Troubleshooting section at the bottom. You can also ask in the #modification-station channel of the [Hades Speedrunning Discord](https://discord.gg/zN7cc8Z); If I'm around, I'll see if I can help you.

For more examples, you can find a variety of runs in RunControl's GitHub repository. You can find them [here](https://github.com/Hades-Speedrunning/RunControl/tree/main/RunControl/DemoRuns).

# Data Types

## encounter

A table which lets you define the events of a combat encounter. It has the following fields:

### Name

**Type**: string  
The name of the desired encounter, e.g. `SurvivalTartarus` or `ThanatosElysium`. If left blank, it will always be a standard combat (*configurable*).

### Waves

**Type**: sequence of tables  
The exact waves of enemies that should appear. Each enemy has the fields **Enemy** (a string) and **Num** (a number). If Waves are undefined, random enemies will appear.

### Example

Here's a regular Tartarus combat you might see:

```lua
Data = {
    Waves = {
        {{ Enemy = "Witch", Num = 9 }, { Enemy = "Numbskull", Num = 5 }},
        {{ Enemy = "Witch" }, { Enemy = "Numbskull", Num = 3 }},
        {{ Enemy = "Witch", Num = 7 }, { Enemy = "ArmoredPest", Num = 2 }},
    },
},
```

This would produce a 3-wave room consisting of:

1.  A wave of 9 Witches and 5 Numbskulls
2.  A wave of 1 Witch and 3 Numbskulls
3.  A wave of 7 Witches and 2 Armored Pests

(And then you would reset.)

If you wanted the same enemies in a Thanatos room, it would look like this:

```lua
Data = {
    Name = "ThanatosTartarus",
    Waves = {
        {{ Enemy = "Witch", Num = 9 }, { Enemy = "Numbskull", Num = 5 }},
        {{ Enemy = "Witch" }, { Enemy = "Numbskull", Num = 3 }},
        {{ Enemy = "Witch", Num = 7 }, { Enemy = "ArmoredPest", Num = 2 }},
    },
},
```

## roomFeatures

A table which lets you set features of a room, such as the random objects that can spawn. It has these fields:

### Flipped

**Type**: boolean  
Controls the orientation of the room. This is generally pre-determined and can be left blank. The main exceptions are any room with two entrances, and any non-story/endshop room after a Chaos gate.

### ChaosGate

**Type**: table  
**Fields**: Force (boolean), RoomName (string)  
Lets you force a Chaos gate, or defining its contents. If Force is true, the gate will always appear, if Force is false, the gate will never appear, and if Force is undefined, the gate will appear only if it spawns due to a Light of Ixion (*configurable*). Regardless of this value, RoomName will define what room the gate contains.

### ErebusGate

**Type**: table  
**Fields**: Force (boolean)  
Lets you force an Erebus gate. Unlike Chaos, RoomName and Reward for an Erebus gate are defined in exitDoors.

### Well

**Type**: table  
**Fields**: Force (boolean)  
Lets you force a Well of Charon. Note that its contents are defined in the `shop` data type.

### SellWell

**Type**: table  
**Fields**: Force (boolean)  
Lets you force a Pool of Purging. Note that its contents are defined in the `sellWell` data type.

### Trove

**Type**: table  
**Fields**: Force (boolean)  
Lets you force a Trove.

### FishingPoint

**Type**: table  
**Fields**: Force (boolean)  
Lets you force a Fishing Point.

### GoldPotNum

**Type**: number  
Sets the number of gold pots that spawn in a room. This is normally 1-3 in vanilla runs.

### Example

Here's how this might look for a random combat room:

```lua
Data = {
    Flipped = true,
    ChaosGate = { RoomName = "RoomSecret02" },
    Well = { Force = true },
    GoldPotNum = 1,
}
```

This example would:

1.  Force the room to be flipped
2.  Not force a Chaos gate, but guarantee that it is `RoomSecret02` if it appears
3.  Force a well to appear
4.  Force 1 gold pot to spawn

## boonMenu

A sequence which lets you set what boons a god, pom, or hammer offers. Each boon can have any of the following fields.

### Name

**Type**: string  
The name of the desired boon or hammer. If undefined, the boon will be ignored.

### ForcedRarity

**Type**: string  
The rarity of the boon to be forced. If undefined, default to Common (*configurable*).

### Replace

**Type**: boolean  
Whether the boon is or is not a replace. If undefined, the boon will never be offered as a replace (*configurable*).

### EmptySlot

**Type**: boolean  
If this is true and the boon is ineligible, its slot will be left empty. If undefined or false, the slot will be filled with a random eligible boon (*configurable*).

### AlwaysEligible

**Type**: boolean  
If true, the boon will always be offered, regardless of whether it is eligible or not. If undefined or false, the boon will only be offered if it is eligible (*configurable*).

There are also certain fields specific to Chaos boons:

### CurseName

**Type**: string  
The name of the desired Chaos curse. If undefined, the boon will be ignored.

### BlessingName

**Type**: string
The name of the desired Chaos blessing. If undefined, the boon will be ignored.

### CurseLength

**Type**: number
The number of chambers the curse will take to expire.

### CurseValue

**Type**: number
The exact value of the Chaos curse. If undefined, will be random.

### BlessingValue

**Type**: number
The exact value of the Chaos blessing. If undefined, will be random.

### Example 1

```lua
Data = {
    { Name = "LightningStrike", Replace = true },
    { Name = "BillowingStrength", ForcedRarity = "Epic", AlwaysEligible = true },
    { Name = "DoubleStrike", EmptySlot = true },
}
```

This would produce:

1.  Lightning Strike as a replace, if you have a replaceable attack boon
2.  Epic Billowing Strength, regardless of whether it is eligible or not
3.  Common Double Strike, or an empty slot if Double Strike is not eligible

### Example 2

If you want to guarantee an empty slot (e.g. to replicate a modded hammer menu), that would look like this:

```lua
Data = {
    { Name = "ChargedShot" },
    { EmptySlot = true },
    { EmptySlot = true },
}
```

Since `Name` is undefined, it will never be eligible, and the bottom 2 slots will always be empty.

### Example 3

```lua
Data = {
	{
		CurseName = "Abyssal",
		BlessingName = "Shot",
		BlessingValue = 1.7,
		ForcedRarity = "Epic",
	},
	{
		CurseName = "Maimed",
		BlessingName = "Defiance",
		CurseValue = 4,
		ForcedRarity = "Legendary",
		AlwaysEligible = true,
	},
	{
		CurseName = "Atrophic",
		BlessingName = "Soul",
		CurseLength = 3,
	}
}
```

This would produce:

1. Epic Abyssal Shot, with a random amount of trap damage and a 70% cast bonus
2. Maimed Defiance, with 4 self-damage, regardless of whether it is eligible or not
3. Common Atrophic Soul, with random amounts, lasting for 3 chambers

## exitDoors

A sequence which lets you define what the exit doors of a chamber will contain.

### Example 1

```lua
Data = {
    { RoomName = "A_Story01" },
    { RoomName = "A_MiniBoss01", Reward = "Boon", GodName = "Zeus" },
    { RoomName = "A_Combat05", Reward = "DaedalusHammer", AlwaysEligible = true },
}
```

This would produce:

1.  Sisyphus, if he is eligible
2.  A Bombers room with Zeus on the door, if it is eligible
3.  An `A_Combat05` room with a Hammer on the door, regardless of whether `A_Combat05` or your first hammer have already appeared

If Sisyphus/Bombers were not eligible, you would be offered a random room with the same reward instead. If Zeus were not eligible (e.g. if you'd already filled your god pool), a Bombers room with a random boon would be offered instead.

### Example 2

If you don't know exactly what was on a set of doors, you can set a group of rooms using the `ForcedRooms` and `EligibleRooms` fields.

```lua
Data = {
    [2] = { ForcedRooms = RCLib.Minibosses },
    [3] = { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
}
```

This example assumes exit 1 is a Chaos gate, and thus skips to exit 2. It would produce:

1.  A random Midboss from this biome, if one is eligible
2.  A random combat room with Obols on the door

Its is generally best to used `ForcedRooms` for midbosses and `EligibleRooms` for standard combats. `ForcedRooms` will default to a random room if none of them are eligible, whereas `EligibleRooms` will result in an error.

## shop

A sequence which lets you define the contents of both shops and wells. Each item can have the following fields:

### Item

**Type**: string  
The name of the item to force. If undefined, the item will be ignored.

### Contents

**Type**: string  
The contents of a random bag or Fateful Twist. If undefined, the contents will be random.

### EmptySlot

**Type**: boolean  
If this is true and the item is ineligible, its slot will be left empty. If undefined or false, the slot will be filled with a random eligible item (*configurable*).

### AlwaysEligible

**Type**: boolean  
If true, the item will always be offered, regardless of whether it is eligible or not. If undefined or false, the item will only be offered if it is eligible (*configurable*).

### Example 1

Here's a possible midshop:

```lua
Data = {
    { Item = "RandomBag", Contents = "Zeus" },
    { Item = "DaedalusHammer" },
    { Item = "Hermes", AlwaysEligible = true },
}
```

This would produce:

1.  A random god bag which, when bought, would give you Zeus
2.  A Hammer, if it is eligible
3.  Hermes, regardless of whether he is eligible or not

If you'd already seen your first hammer, a random reward (e.g. food or darkness) would appear in slot 2 instead.

### Example 2

Wells look very similar:

```lua
Data = {
    { Item = "KissOfStyx" },
    { Item = "FatefulTwist", Contents = "BraidOfAtlas" },
    { Item = "AetherNet", AlwaysEligible = true },
}
```

This would produce:

1.  A Kiss of Styx, if it is eligible
2.  A Fateful Twist which, when bought, would give you a Braid of Atlas
3.  An Aether Net, regardless of whether it is eligible or not

If you had full DDs or were using SDs, a random healing item would appear in slot 1 instead.

## sellWell

A sequence which lets you define the contents of a Pool of Purging. Fields for each boon are:

### Name

**Type**: string  
The name of the boon to sell.

### Value

**Type**: number  
The money the boon will give when sold. If undefined, default to 0.

### EmptySlot

**Type**: boolean  
If this is true and the boon is ineligible, its slot will be left empty. If undefined or false, the slot will be filled with a random eligible boon (*configurable*).

### Example

```lua
Data = {
    { Name = "ThunderDash", Value = 80 },
    { Name = "SeaStorm", Value = 420 },
    { Name = "FloodShot", Value = 65 },
},
```

This would produce a well with Thunder Dash, Sea Storm, and Flood Shot, available to sell for 80, 420, and 65 Obols. If you did not have all of these boons, random eligible boons would be offered instead (*configurable*).

## startingReward

Lets you set the reward that appears in chamber 1. It has the fields **Reward** (a string) and **AlwaysEligible** (a boolean).

### Example

```lua
Data = {
    Reward = "DaedalusHammer",
}
```

This would force your starting reward to be a hammer.

## lernieEncounter

Lets you define which Lernie variants appear in her fight. It has the fields **MainHead** (a string) and **SideHeads** (a sequence of strings).

### Example

```lua
Data = {
    MainHead = "BlueLernie",
    SideHeads = { "PinkLernieHead", "OrangeLernieHead" },
}
```

This would produce a blue main head, with pink and orange side heads.

# Troubleshooting

So what if you write in what appears to be a correct run, but don't get what you asked for? Here's some of the most common issues you might run into.

## Not writing the Data field

If your piece of data isn't in a table named Data, the modpack won't find it.

### Example

```lua
[18] = {
    exitDoors = {
        { RoomName = "B_Combat07", Reward = "Boon" },
    },
},
```

This would not force anything. Instead, it should look like this:

```lua
[18] = {
    exitDoors = {
        Data = {
            { RoomName = "B_Combat07", Reward = "Boon" },
        },
    },
},
```

## Incorrect Names

You can find full list of the usable names for boons/enemies/etc. in \\Mods\\RCLib\\Map.lua. Search this to confirm that your capitalisation and spelling are as they should be.

Note that Flood Flare and Trippy Flare are actually dummy traits that are never eligible. Write in `FloodShot` and `TrippyShot` instead.

## Incorrect door indices

In Tartarus, Erebus gates are always the first door. In other biomes, they are always the last.

## Eligibility

Certain things can be ineligible, even when you might not expect them to be. Try setting them to have `AlwaysEligible = true` and see if they start appearing.

Story rooms, fountains, and shops can also only appear once each. If some doors are left unspecified, these rooms can appear earlier than desired and be ineligible later. This is best avoided by setting any unknown doors to have `EligibleRooms = RCLib.StandardCombats`.

## Bugs

*RunControl is not a perfect modpack!* If you've checked all of these and your run *still* seems not to be working, it could be a bug with the pack. My name is SleepSoul, as is my Discord handle, and I'm most easily contacted through the [Hades Speedrunning Discord](https://discord.gg/zN7cc8Z)- let me know if something isn't working, and I'll help you.
