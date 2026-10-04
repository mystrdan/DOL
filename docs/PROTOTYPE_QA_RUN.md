# Prototype QA Run — Manual Pass 01

## Purpose
This is the first concrete manual QA script for the DOL Game 1 prototype. It is intended to be executable by a human without requiring debug knowledge.

## Environment
- Target: Godot prototype
- Primary target: Android
- Secondary target: desktop
- Build status: NOT yet runtime-verified in the development environment
- Test build/version: record the commit SHA used for the test

## Pass 01 — Fresh Start
1. Launch the game.
2. Wait for the first dialogue.
3. Confirm the player, objective, and health are readable.
4. Confirm Settings can be opened.
Record launch success, first-frame/UI problems, dialogue visibility, and settings accessibility.

## Pass 02 — Movement
Desktop: move in all four directions, stop at the settlement edge, then move toward the road and river.
Touch: toggle Touch Controls off/on; hold and release every directional control; test Attack and Dodge.
Pass: no stuck input and the player remains inside world bounds.

## Pass 03 — Settlement Interaction
1. Walk near the Settlement Guide.
2. Interact if prompted.
3. Continue toward the old road marker.
4. Enter the marker area and press Interact.
Pass: the marker reads as interactable, dialogue does not block movement, and the route toward the river remains obvious.

## Pass 04 — River / Sacred Landscape
Observe whether the river reads as a physical/environmental feature and whether the sacred/community landscape reads as a place rather than a magical arena.
Pass: the tester can describe the next destination without developer help.

## Pass 05 — Veil Event
Approach the Veil, observe the visual change, confirm the player is not unexpectedly locked, and confirm the Veil-Torn appears.
Pass: the event feels like a disturbance of an existing place rather than a generic fantasy portal.

## Pass 06 — Combat
Test light attack, dodge, enemy attack/contact, hit feedback, enemy defeat, and player defeat.
Record approximate time to defeat, damage received, dodge usefulness, enemy readability, and feedback strength.
Pass: a first-time player can understand the basic fight through play.

## Pass 07 — Restart
Allow defeat, confirm the restart instruction, press R, and verify checkpoint reset, enemy reset, objective reset, and absence of duplicate enemies.

## Pass 08 — Settings Persistence
For each current setting:
1. Open Settings.
2. Change the option.
3. Close Settings.
4. Confirm immediate effect.
5. Restart.
6. Confirm the state persists.
Current settings: Screen shake and Touch controls.

## Pass 09 — Story Recall
After completion, ask without prompting:
1. Where were you?
2. What seemed wrong?
3. Why did you follow the old road?
4. What happened at the Veil?
5. What do you think happens next?

## Pass 10 — Cultural / Visual Review
Before final art:
- identify every real-world cultural reference;
- attach a source;
- identify the specific community/tradition;
- classify the reference;
- check whether it has become generic fantasy;
- remove unsupported symbols, clothing, language, ritual behavior, or sacred claims.

## Bug Recording
Use: [P0/P1/P2/P3] Area — short description.
Include platform, reproduction steps, expected result, actual result, screenshot/video if available, and commit SHA.

## Exit Gate
Fix P0 blockers, P1 core-flow failures, unclear navigation, combat readability problems, and major cultural representation concerns before expanding content.
