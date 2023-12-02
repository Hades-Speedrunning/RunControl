# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

- Support for high heat features- Benefits Package, Jury Summons, and Approval Process.
- Support for Anvils.
- Support for Hades' additional spawns.

## [1.2.0-RC1] - 2023-12-01

This update adds several features for better configurability and ease of run creation, as well as several bug fixes and under-the-hood refactors. If no critical bugs are found, this will be released as 1.2.0.

### Added

- Option for special rooms (fountain, story, shop, midboss) to only appear if forced.
- Option for rarities to only be forced when eligible (e.g., Common boons won't appear when you have a Yarn).
- Option for gold pots to only be forced up to the maximum amount a room allows.
- Encounters can now specify enemy types and wave counts, rather than having to include exact spawn counts.
- Runs can now specify which God Theseus should summon.
- RunControl is now compatible with extensions like StartingBuildMod.
- A specific God can now be forced in chamber 1, just like in other chambers.

### Changed

- The wells and pools in midbiomes will now appear even if a run does not force them. (They can still be forced not to appear.)
- Encounters/Bosses have now been split into a new menu page, separate from Rooms/Rewards.
- Sell wells will now infer the value of a boon if none is specified, instead of defaulting to 0.

### Fixed

- Wells and shops will no longer fail to force items if their data has gaps (e.g. if you specify items 1 and 3 but not 2).
- You can now force Chaos gates not to appear, even if you have a Light of Ixion.
- Rare Crop will no longer fail to appear when forced.
- Fixed some errors in ExampleRun.lua.
- The default rarity setting will no longer cause hammers to have rarity.

## [1.1.0] - 2023-10-04

This is a smaller update, which doesn't add many new features to the runs themselves, but adds a little more polish to 1.0.0 (plus some new options).

### Added

- Interface/QOL settings page.
- Option to always show chamber number in the top-right.
- Option to replace the modpack version text with the name of the current run.

### Changed

- Chaos gates are no longer counted in exitDoors.

### Fixed

- The D_Mini09 chamber in Styx will no longer have random encounters.
- Wells will no longer occasionally have an incorrect item after rerolling.
- Corrected a room orientation error in the 6:07 Talos run.
- Bosses and Styx midbosses will no longer need to be AlwaysEligible in order to appear, and will not appear on non-midboss Styx wings.
- The ExampleRun file no longer has a missing value in IndexedBy.
- Indexing Gods by appearanceNum will now work correctly in Styx shop.
- Forcing an empty slot as the only Boon from a God will no longer cause a crash.
- Getting a Light of Ixion the original player did not get will no longer change the possible doors in a run.

## [1.0.0] - 2023-09-29

First full release!

### Added

- Added Chaos boon documentation to HOWTO.md.
- Added a special thanks section to the Introduction screen.

### Changed

- Updated the Introduction text slightly.

## [1.0.0-RC3] - 2023-09-28

### Fixed

- Chamber 1 encounter will no longer be random.
- Rewards can no longer be offered on story rooms and shops.

## [1.0.0-RC2] - 2023-09-28

### Fixed

- RewardControl gods will no longer take precedence over those forced with a keepsake.
- EncounterControl will no longer try to force waves where it shouldn't, such as in midboss and non-combat rooms.

## [1.0.0-RC1] - 2023-09-27

### Added

- Implemented the 5:04 current WR by DrkFrst and the 5:57 former WR by Lili.
- Expanded the README and added a HOWTO file, explaining the run format.

### Changed

- BoonControl's InferReplaces config option is now off by default.

### Fixed

- Using multiple gods in the same room will now work again.

## [1.0.0-beta.7] - 2023-09-27

### Fixed

- Gods will now only be offered if they are in your pool.
- Replaces will no longer always be eligible.

## [1.0.0-beta.6] - 2023-09-26

### Added

- Implemented the 5:49 Achilles WR by 185.

### Fixed

- BoonControl's FillWithEligible config option will now work on Chaos.

## [1.0.0-beta.5] - 2023-09-24

### Added

- Implemented the 6:29 former Demeter WR by Ananke.

### Changed

- Lists that don't, at any point, specify a dataType will now throw out an error without successfully returning anything. This prevents unintended behaviour or crashes that not specifying could potentially cause.

### Fixed

- Elite rooms with Fated Key rewards will now work correctly.

## [1.0.0-beta.4] - 2023-09-22

### Added

- Implemented the 5:16 Hera WR by Croven.

### Changed

- Runs to be implemented in the further future have been removed from the menu for the time being.

### Fixed

- The game will no longer crash when you buy a random bag without specified contents.

## [1.0.0-beta.3] - 2023-09-19

### Added

- Victory screen UI now contains original heat used and number of clears for a given run.

### Fixed

- Trial doors will no longer cause a crash when the following room has a forced encounter.
- Hammers will now have their eligibility checked correctly.
- Nourished Soul will now be forced correctly.
- Upgraded boons (in Styx) will now be added to shops correctly.

## [1.0.0-beta.2] - 2023-09-16

### Added

- There's now a table of Styx Hermes' overrides, so you don't have to specify them manually.
- God names in shops are now written in as GodName, to match rooms.
- You can now specify which god will appear in random bags.

### Changed

- Updated to most recent version of ModUtil (2.9.0).

### Fixed

- Runs without metadata will no longer cause a crash when selected.
- Reward eligibility will now be checked properly.
- Fateful Twists will no longer cause a crash when wells are reopened after buying them.
- Rooms not in ForcedRooms fields will no longer be forced.
- Boons labelled as AlwaysEligible will no longer be forced when they don't exist.

## [1.0.0-beta.1] - 2023-09-14

### Added

- Mod settings will now be saved across play sessions.
- The victory screen will now show the selected run's name and original time, if applicable.

### Changed

- Introduction screen in the RunControl settings is now more detailed.

### Fixed

- Fixed the game crashing when 'lava' Lernie heads are forced.

## [0.11.0] - 2023-09-12

### Added

- Dependency: ErumiUILib
- There's now a full UI for RunControl! This allows configuring the settings across all mods, as well as selecting a run to play.
- New EncounterControl config options: CheckEligibility and RequireForcedSpecialEncounters. Latter prevents Than and survival showing up when not forced.
- There are now placeholder files for a variety of historic runs, to be included as demos in the full release.

### Changed

- Renamed the DefaultRarity = false setting in BoonControl to "Random".

### Removed

- Removed the DisallowedGods config field in BoonControl.

## [0.10.0] - 2023-09-09

### Added

- BoonControl now has fields for BlessingValue, CurseValue, and CurseLength of Chaos boons.
- RoomControl now has fields for EligibleRooms and ForcedRooms, e.g. when a standard combat or miniboss was on a door. Note that this can only narrow the pool of rooms, not widen it.
- RCLib can now index by "priority"; It will cancel the current search and instead iterate through all sublists until it finds one valid and non-empty, or runs out.
- SellControl and ShopControl now have FillWithEligible config options.
- RewardControl, RoomControl, and ShopControl now have CheckEligibility config options. These can be bypassed with the AlwaysEligible field.

### Changed

- Renamed the OverridePrereqs field in BoonControl to AlwaysEligible.

### Fixed

- Trials forced by RewardControl will now correctly display the elite skull and sparkles.
- RoomControl will no longer apply when not enabled.
- Fixed names for Winter Harvest and Poseidon's Aid.

## [0.9.0] - 2023-09-02

### Added

- You can now force a number of empty slots to appear in a BoonControl menu, even if FillWithEligible is enabled.
- roomFeatures can now contain fishing points.
- BoonControl now has a config option to either check the eligibility of boons being forced, or to always force them.
- RewardControl can now force specific gods to appear in Trials.

### Fixed

- Ixions and Trove Trackers will now work correctly, even when RequireForcedFeatures is enabled in RoomControl.
- RoomControl can now force features *not* to appear- previously, Force = false would still allow them to show up unless RequireForcedFeatures was on.

## [0.8.0] - 2023-08-30

### Added

- RewardControl now supports a startingReward data type to set the reward given in chamber 1.
- RewardControl now supports setting rooms to be elite encounters.
- RoomControl now supports setting laurel colour for rooms.
- BoonControl has a new config feature called FillWithEligible; if this is enabled, any empty slots in a boon menu will be filled with eligible boons from the vanilla menu.
- BoonControl now supports replace boons. Also added a config option to either infer that a boon is a replace (based on whether we already have the slot filled), or require it to be specified.
- EncounterControl now supports a lernieEncounter data type. Currently, this is quite primitive, but it still allows setting the colour of the main and side heads.
- ShopControl now allows you to specify the contents of a Fateful Twist.

### Changed

- Run files now allow you to sort by dataType in a single central table, rather than requiring sub-tables for each mod. This shrinks the files slightly and makes them much more readable.

### Fixed

- Room orientation will now be set correctly.

## [0.7.1] - 2023-08-18

### Fixed

- BoonControl will no longer fail to offer consumable boons, such as Last Stand and Deathless Stand.

## [0.7.0] - 2023-08-14

### Added

- SellControl mod to allow forcing the contents of sell wells.
- RoomControl now has a field for number of gold pots in a room.
- RoomControl can now force miniboss wings in Styx.
- ShopControl now supports bounties, as well as rewards with overrides (such as Styx Hermes).

### Fixed

- BoonControl will no longer cause a crash when you reroll a sell well.
- Fixed a rare EncounterControl crash on door unlock.

## [0.6.0] - 2023-08-06

### Added

- BoonControl now supports Chaos.
- ShopControl now supports wells.

### Changed

- RunControl now has a Runs folder instead of a single Runs.lua file. This makes adding runs easier.

### Fixed

- BoonControl will no longer cause a crash when you reroll a well.

## [0.5.0] - 2023-08-01

### Added

- EncounterControl mod to set events of ingame encounters.

### Changed

- RCLib now checks roomName more safely.

## [0.4.0] - 2023-07-30

### Added

- ShopControl mod to set contents of shop rooms.
- RCLib conditions now include roomName for forcing data per-layout.

### Changed

- RCLib can now infer the type of a list (currently only Indexed exists), making it no longer necessary to specify.

### Fixed

- RCLib now has the correct code for Pitch-Black Darkness.
- RewardControl should now function more correctly and consistently, especially for double-exits.
- RoomControl's RequireForcedSpecials config option should now function correctly.

## [0.3.0] - 2023-07-30

### Added

- RoomControl mod to set tiles, as well as special objects like Chaos gates and wells and tile orientation.
- BoonControl now has config option to disallow control of certain gods. Currently set to include Chaos and Poms, as these are not yet implemented.

### Changed

- RCLib will no longer override conditions.chamberNum and conditions.biome if they were included in a GetList call.

## [0.2.0] - 2023-07-24

### Added

- Dependency: PrintUtil
- RewardControl mod to set room rewards based on input data.
- RemoveCutscenes mod from speedrunning modpack; Removes intro and outro cutscenes from runs for convenience.

## [0.1.0] - 2023-07-24

### Added

- Dependencies: ModUtil, RCLib
- RunControl mod for version display, UI, and config of other mods.
- BoonControl mod to set boon menus based on input data.
