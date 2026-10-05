# DOL Character Creation & Progression

## Purpose

Dawn of Longlat begins with the player making a sequence of meaningful choices before entering the first playable region.

The player should feel that they are choosing who they are, not selecting a generic RPG class.

## Design principle

**Choice defines the player's relationship to Longlat. Progression defines what they become.**

The core story remains canonical. Player choices change starting identity/background, starting strengths, early dialogue/context, preferred combat direction, appearance, and later cosmetic/gameplay unlock paths.

Choices must not rewrite the Dawn event, turn real-world religions into player classes, assign real-world ethnic identity through a menu, or reduce African cultures to selectable stereotypes.

## Opening flow

### 1. The Player's Beginning

The game asks a small number of narrative questions through short scenes rather than a questionnaire.

Example questions:
- Where did you spend most of your early life?
- What did you learn to do first?
- When something strange happens, what do you do?

Possible answers can establish tendencies such as road/travel, protection, observation, building/work, investigation, helping others, caution, or curiosity.

These are not morality tests and should never create a single objectively correct build.

### 2. Choose Your Character

The player selects an available DOL character.

Each character should have:
- name;
- visual identity;
- appearance options;
- personality direction;
- starting attribute bias;
- preferred combat style;
- personal history;
- starting costume;
- short introduction.

The first game should have a small, deeply authored roster rather than dozens of shallow characters.

### 3. Personalize

The player can customize available options such as:
- skin-tone variants within the fictional world's character range;
- hairstyle;
- facial/feature presets;
- body presentation where supported;
- clothing;
- accessories;
- color/material variants.

Final options will be determined by the character-art pipeline and cultural review.

### 4. Confirm

The player sees a compact summary:
- Name
- Character
- Background
- Starting strengths
- Appearance

Then:

**Begin the Dawn**

## Progression

The player earns XP through:
- exploration;
- combat;
- discoveries;
- meaningful interactions;
- story progression;
- optional challenges.

Leveling should unlock decisions rather than simply inflate numbers.

A level may provide:
- skill point;
- new ability;
- ability upgrade;
- costume unlock;
- appearance option;
- accessory;
- lore/discovery unlock;
- new dialogue/context;
- small stat increase.

Not every level needs to provide everything.

## Skill system

Keep skills readable and grouped into a few branches:

### Movement
Dodge improvements, mobility options, recovery.

### Combat
Attack chains, charged attacks, defensive timing, counters.

### Survival
Health, recovery, resistance.

### Signature
Character-specific abilities that express who the character is.

The first game starts small and expands only when gameplay proves the need.

## Character identity vs. build

Character identity comes from:
- story;
- animation;
- dialogue;
- silhouette;
- starting ability;
- personal history.

Player build comes from:
- skill choices;
- upgrades;
- equipment/costume effects if introduced;
- play style.

This keeps characters distinct.

## Costumes

Costumes are primarily identity and expression.

They can provide appearance changes and alternate visual variants.

Gameplay bonuses should be rare and clearly communicated. No costume should create a pay-to-win structure.

## Appearance progression

Appearance can evolve through play:
- hairstyles;
- accessories;
- clothing;
- costume sets;
- cosmetic variants;
- scars/marks only when narratively justified.

Not every visual change needs a stat effect.

## Unlock philosophy

Unlocks should come from the world.

Examples:
- helping a settlement unlocks a local clothing variant;
- completing an exploration challenge unlocks an accessory;
- discovering a historical site unlocks a lore cosmetic;
- reaching a story milestone unlocks a major costume.

Avoid generic loot-box logic.

## Persistent profile

The eventual player profile must persist:
- chosen character;
- player name;
- opening choices;
- appearance selections;
- level;
- XP;
- spent/unspent skill points;
- unlocked skills;
- unlocked costumes;
- equipped costume;
- unlocked appearance options;
- story flags;
- discovery flags.

Settings remain separate from progression.

Godot provides writable user:// storage for persistent player data, while ConfigFile is appropriate for user settings. Save-game data should therefore have its own save structure rather than sharing settings.cfg. citeturn0search3turn0search4

## Technical direction

Use data-driven player definitions rather than hardcoding every character into the player controller.

Godot Resources are suitable for character definitions and reusable game data because custom Resources can be serialized and edited independently from gameplay nodes. citeturn0search2

Recommended future structure:
- data/characters/
- data/skills/
- data/costumes/
- data/appearance/
- scripts/player_profile.gd
- scripts/progression_manager.gd
- scripts/save_manager.gd

## Prototype scope

The current 10–15 minute prototype should not implement the complete progression system.

It should prove:
- character selection can exist before gameplay;
- one selected character/profile can enter the Longlat Marches;
- selected appearance is represented;
- XP/level architecture can be added without rewriting movement/combat;
- profile persistence is separate from settings.

Full skill trees, large cosmetic inventories, multiple characters and deep customization remain post-vertical-slice systems.

## Rule

**Let players shape their character without making them responsible for inventing the entire world.**
