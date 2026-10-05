# DOL Prototype Implementation Backlog

## Goal

Turn the Game 1 vertical slice specification into the smallest executable prototype.

## Build Order

### P0 — Project bootstrap
- [x] Create project using the selected engine/runtime.
- [x] Create Main/Prototype scene.
- [x] Establish input abstraction.
- [x] Establish prototype progression/state management.
- [ ] Add debug build flag.

### P0 — Player
- [x] Player root/controller.
- [x] Movement.
- [x] Camera.
- [x] Collision.
- [x] Interaction detector.
- [x] Health/death.
- [x] Checkpoint respawn.

### P0 — World
- [x] Block out Longlat Gate / settlement entry.
- [x] Block out settlement.
- [x] Block out common yard.
- [x] Block out Old Road.
- [x] Block out river crossing.
- [x] Block out sacred/community landscape.
- [x] Block out Veil.
- [x] Block out combat clearing.
- [ ] Block out return route as a distinct presentation zone.

### P0 — Interaction
- [x] Interaction prompt (text/status prototype).
- [x] NPC interaction.
- [x] Short dialogue system.
- [x] Objective updates.
- [x] Zone triggers.

### P0 — Combat
- [x] Light attack.
- [x] Dodge.
- [x] Hit detection.
- [x] Damage/recovery.
- [x] Veil-Torn pursuit/attack state.
- [ ] Rush.
- [ ] Swipe.
- [ ] Veil Pulse.
- [ ] Retreat.
- [x] Death/defeat.

### P1 — First Veil
- [x] Dormant state (subtle visual landmark).
- [ ] Disturbed state.
- [x] Torn state (combat trigger + active visual).
- [ ] Spatial Echo.
- [ ] Audio transition.
- [x] Combat trigger.

### P1 — HUD
- [x] Health.
- [x] Objective.
- [x] Interaction prompt.
- [x] Touch controls.
- [x] Restart.
- [ ] Full pause menu.
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


## Current verification state

The repository contains the prototype code and greybox scene, but the current environment has not executed a Godot build. Treat runtime behavior as **unverified** until the project is opened/run in Godot 4.7.2 or an equivalent CI environment.

Latest implementation focus: keep world presentation state-driven and prevent supernatural landmarks from appearing fully active before their narrative trigger.
