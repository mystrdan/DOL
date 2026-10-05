# Prototype Character Creation Flow

## Purpose

The opening of Dawn of Longlat should establish the player as a person in the world before the player enters the Longlat Marches.

The first implementation should prove the flow without requiring the full production character-art pipeline.

## Flow

**Opening choices → Character selection → Appearance → Confirmation → Begin the Dawn**

### 1. Opening choices

Use three short narrative choices.

Prototype IDs:

- `early_life`: where the player spent most of their early life
- `first_skill`: what they learned to do first
- `strange_event`: how they respond when something feels wrong

Choices are stored exactly in the player profile.

They may establish starting tendencies, but they are not morality tests.

### 2. Character selection

The prototype uses a small authored roster.

Each definition is data-driven and carries:

- character ID
- display name
- description
- starting stats
- starting skill
- starting costume
- base appearance
- personality tags

The player profile stores only the selected character ID and relevant choices. Character definitions remain separate from save state.

### 3. Appearance

The prototype needs only a small set of appearance keys.

Example:

`skin`, `hair`, `face`, `body`, `accessory`

The visual prototype may represent these through simple placeholder variation. Final options require character-art and cultural review.

### 4. Confirmation

Show:

- player name
- selected character
- opening background/tendency
- starting strengths
- appearance

Then allow **Begin the Dawn**.

## Persistence boundary

Settings remain in `user://settings.cfg`.

Player progression is separate and uses `user://player_profile.tres`.

The profile stores:

- identity
- opening choices
- appearance
- level/XP
- skill points
- unlocks
- story flags
- discovery flags

This separation prevents a settings reset from destroying player progression.

## Current implementation foundation

Added:

- `scripts/character_definition.gd`
- `scripts/player_profile.gd`
- `scripts/save_manager.gd`

These establish the data boundary without coupling character progression to `player_controller.gd`.

## Next implementation step

Add the minimal opening UI and one or two authored character definitions.

The first playable slice should remain small: prove that a selected profile can be created, saved, loaded, and passed into Longlat before expanding customization.

## Guardrails

- No real-world religion as a class.
- No real-world ethnic identity selection.
- No stereotype-based stats.
- No loot-box character acquisition.
- No requirement for the player to invent the world's culture.

**The player chooses who they are; the world remains authored.**
