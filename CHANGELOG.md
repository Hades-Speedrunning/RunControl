# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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