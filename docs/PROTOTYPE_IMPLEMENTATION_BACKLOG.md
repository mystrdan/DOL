# DOL Prototype Implementation Backlog

## Goal

Turn the Game 1 vertical slice specification into the smallest executable prototype.

## Build Order

### P0 — Project bootstrap
- [ ] Create project using the selected engine/runtime.
- [ ] Create Main/Prototype scene.
- [ ] Establish input abstraction.
- [ ] Establish scene/state management.
- [ ] Add debug build flag.

### P0 — Player
- [ ] Player root/controller.
- [ ] Movement.
- [ ] Camera.
- [ ] Collision.
- [ ] Interaction detector.
- [ ] Health/death.
- [ ] Checkpoint respawn.

### P0 — World
- [ ] Block out Longlat Gate.
- [ ] Block out settlement.
- [ ] Block out common yard.
- [ ] Block out Old Road.
- [ ] Block out river crossing.
- [ ] Block out sacred/community landscape.
- [ ] Block out Veil.
- [ ] Block out combat clearing.
- [ ] Block out return route.

### P0 — Interaction
- [ ] Interaction prompt.
- [ ] NPC interaction.
- [ ] Short dialogue system.
- [ ] Objective updates.
- [ ] Zone triggers.

### P0 — Combat
- [ ] Light attack.
- [ ] Dodge.
- [ ] Hit detection.
- [ ] Damage/recovery.
- [ ] Veil-Torn state machine.
- [ ] Rush.
- [ ] Swipe.
- [ ] Veil Pulse.
- [ ] Retreat.
- [ ] Death/defeat.

### P1 — First Veil
- [ ] Dormant state.
- [ ] Disturbed state.
- [ ] Torn state.
- [ ] Spatial Echo.
- [ ] Audio transition.
- [ ] Combat trigger.

### P1 — HUD
- [ ] Health.
- [ ] Objective.
- [ ] Interaction prompt.
- [ ] Touch controls.
- [ ] Pause/restart.
- [ ] First-use hints.

### P1 — Audio
- [ ] Settlement ambience placeholder.
- [ ] Road ambience placeholder.
- [ ] River ambience placeholder.
- [ ] Veil distortion.
- [ ] Enemy cues.
- [ ] Combat impacts.

### P1 — Test instrumentation
- [ ] Record scene transitions.
- [ ] Record first movement time.
- [ ] Record first interaction time.
- [ ] Record first attack time.
- [ ] Record deaths.
- [ ] Record restart count.
- [ ] Debug teleport.
- [ ] FPS/performance overlay.

### P2 — Presentation
- [ ] Replace greybox geometry selectively.
- [ ] Improve lighting.
- [ ] Improve animation.
- [ ] Add environmental storytelling.
- [ ] Refine UI.
- [ ] Tune audio.
- [ ] Mobile performance pass.

## Dependencies

Player movement → interaction → world traversal → Veil trigger → combat → checkpoint → complete slice.

Do not build final art before the greybox loop is playable.

## Definition of First Runnable Build

A developer can launch the build, move through a greybox Longlat settlement, speak to one NPC, receive the Old Road objective, reach the river, trigger the Veil, fight the Veil-Torn, die or win, restart, and reach the closing reveal.

Anything beyond that is optional until the loop is proven.

## Rule

**Greybox first. Feel first. Research alongside. Polish last.**
