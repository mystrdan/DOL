# DOL Technical Direction

## Status

Pre-production direction. Engine not locked.

## Priority

Choose technology based on the first playable slice, not the imagined final continent.

## Prototype Requirements

The first technical prototype needs:
- mobile-friendly rendering;
- responsive player movement;
- touch input;
- camera;
- collision;
- simple enemy AI;
- basic combat;
- interaction;
- scene transitions;
- save/checkpoint capability;
- basic audio;
- debug/test controls.

## Architecture Principle

Keep gameplay systems modular:

- Player
- Input
- Combat
- Enemy
- Interaction
- World/Level
- Dialogue
- Save
- Audio
- UI

Do not build continent-scale infrastructure before the vertical slice proves the core game.

## Platform Priority

1. Android prototype
2. Android performance pass
3. PC/developer testing
4. Additional platforms after the core loop is stable

## Performance Philosophy

Target a stable, responsive mobile experience before increasing visual complexity.

Avoid:
- unnecessary open-world streaming;
- excessive particle effects;
- giant texture budgets;
- systems that exist only for future content.

## Development Rule

**Prototype the game, then choose the scale.**
