# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2023-07-30

### Added

- RoomControl mod to set tiles, as well as special objects like Chaos gates and wells and tile orientation
- BoonControl now has config option to disallow control of certain gods. Currently set to include Chaos and Poms, as these are not yet implemented

### Changed

- RCLib will no longer override conditions.chamberNum and conditions.biome if they were included in a GetList call

## [0.2.0] - 2023-07-24

### Added

- Dependency: PrintUtil
- RewardControl mod to set room rewards based on input data
- RemoveCutscenes mod from speedrunning modpack; Removes intro and outro cutscenes from runs for convenience

## [0.1.0] - 2023-07-24

### Added

- Dependencies: ModUtil, RCLib
- RunControl mod for version display, UI, and config of other mods
- BoonControl mod to set boon menus based on input data