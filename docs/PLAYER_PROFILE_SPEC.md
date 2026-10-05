# DOL Player Profile Specification

## Purpose

The player profile is the persistent identity layer between character creation and moment-to-moment gameplay.

It is separate from engine settings, temporary combat state, world state, and research records.

## Core profile

Fields:
- profile_version
- player_name
- character_id
- background_id
- opening_choices
- appearance
- level
- xp
- skill_points
- unlocked_skills
- unlocked_costumes
- equipped_costume
- unlocked_appearance_options
- story_flags
- discovery_flags

## Character definition

A character definition is authored game data.

Fields:
- character_id
- display_name
- description
- starting_stats
- starting_skill
- starting_costume
- base_appearance
- personality_tags

Character definitions should be data-driven so additional characters can be introduced without rewriting the player controller.

## Opening choices

Store the player's actual choices, not only their final derived bonuses.

Example:
- origin = road
- first_skill = travel
- reaction = investigate

This allows later dialogue and story systems to reference the player's history.

## Derived starting profile

Opening choices may produce small starting modifiers.

Examples:
- travel → slightly better movement recovery
- protect → slightly better defensive recovery
- observe → slightly stronger discovery feedback
- build → slightly better interaction efficiency

These are examples, not final balance.

No opening choice should be objectively mandatory.

## Appearance

Appearance is data, not a separate character class.

Possible fields:
- skin_variant
- hair_variant
- face_variant
- body_variant
- accessory_variant
- color_variant

The final options depend on the actual character-art pipeline.

## Progression state

Fields:
- level
- xp
- xp_to_next_level
- skill_points
- unlocked_skills
- unlocked_costumes
- unlocked_appearance_options

XP sources should reward meaningful activity rather than repetitive grinding.

## Equipment / costumes

If gameplay-affecting equipment is eventually introduced, keep it separate from cosmetics.

Possible fields:
- equipped_costume
- equipped_accessories
- equipment_modifiers

Cosmetic-only items should never need combat-stat logic.

## Story state

Keep story progression separate from level progression.

Possible fields:
- current_region
- story_flags
- completed_objectives
- discovered_locations

A high-level character must not automatically mean high story progress.

## Save rules

- Save profile after character-creation confirmation.
- Save after meaningful progression milestones.
- Save before/after major story transitions where practical.
- Keep settings in user://settings.cfg.
- Keep progression in a separate save file.
- Include profile_version for future migration.

Godot's user:// path is designed for writable persistent data in exported projects. citeturn0search4

## Migration

Every persistent profile has a version.

If fields change, the save manager migrates old data instead of discarding it.

## Prototype acceptance

A prototype implementation passes when:
1. a player can select a character;
2. opening choices are captured;
3. the selected profile reaches gameplay;
4. the player's identity can be displayed in debug/UI;
5. a level/XP structure exists without being tied directly to movement code;
6. profile data can be saved separately from settings.

## Rule

**The player profile is the bridge between choice, identity, progression and the world.**
