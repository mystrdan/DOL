# DOL Game 1 — Playable Vertical Slice Specification

## Purpose

This is the implementation contract for the first playable DOL build. It converts the existing story, world, combat, Veil, onboarding, and research foundations into one small build that a developer can implement and test.

**Target:** a 10–15 minute guided-but-explorable prototype in the Longlat Marches.

## Prototype Promise

**Arrival → ordinary life → something wrong → investigation → river crossing → damaged Veil → first supernatural enemy → combat → reveal → return/safe point**

The prototype is not the full game.

## Hard Scope

### Included
- One player character
- One settlement edge
- One short road/exploration pocket
- One river crossing
- One sacred/community landscape
- One damaged Veil
- One enemy type: Veil-Torn
- One short combat encounter
- 5–8 visible NPCs
- 3–4 interactable NPCs
- Basic objective system
- Basic dialogue
- Basic HUD
- Checkpoint/restart
- Minimal audio
- Android-first controls
- Developer/debug reset

### Explicitly excluded
- Open world
- Multiplayer
- Character roster
- Full skill tree
- Crafting
- Inventory economy
- Procedural generation
- Boss fight
- Complex quest chains
- Monetization
- Complete mythology system
- Final art direction
- Full voice acting

## Scene Order

| ID | Scene | Target |
|---|---|---:|
| S01 | Longlat settlement edge | 0–2 min |
| S02 | Common yard / investigation | 2–5 min |
| S03 | Old Road exploration pocket | 5–8 min |
| S04 | River crossing | 8–10 min |
| S05 | Sacred/community landscape | ~10–11 min |
| S06 | Damaged Veil | 11–13 min |
| S07 | Combat arena | 13–15 min |
| S08 | Safe return / reveal | 15 min+ |

## Player

Prototype verbs:
- Move
- Camera/look
- Interact
- Light attack
- Dodge
- Defensive action if implementation remains stable
- One signature ability only if it can be implemented without expanding scope

The player must be useful before becoming supernatural.

## Objective Flow

1. No objective during the first few seconds; let the player observe.
2. Objective appears after the first meaningful NPC interaction: **Investigate the old road.**
3. Crossing the river advances the investigation.
4. The damaged Veil becomes the immediate objective.
5. Combat begins only after the player has a readable moment to observe the Veil.
6. After combat, objective changes to: **Return to Longlat.**

Objectives must be short, readable, and never require a lore lecture.

## NPCs

Prototype NPC set:
- Settlement Elder / Keeper
- Young Trader / Courier
- River Worker
- Worshipper / Community Member
- Child / Younger Resident
- Returning Traveler

Only selected NPCs provide progression-critical information. Others make the settlement feel inhabited.

No NPC should exist only to explain mythology.

## Combat

### Enemy
**Veil-Torn** — original DOL creature.

### Encounter phases
1. Observe
2. Enemy signals
3. Rush
4. Player exchanges attacks
5. Veil Pulse
6. Resolution

### Enemy moves
- Rush
- Swipe
- Veil Pulse
- Retreat

No boss health bar.

### Success

The player understands:
- attacks have commitment;
- dodging creates safety;
- enemy attacks are telegraphed;
- Veil Pulse is an environmental danger.

## Veil

The first Veil is DOL-original.

Prototype behavior: **Spatial Echo** — a nearby object briefly appears in the wrong position before reality corrects itself.

State progression: **Dormant → Disturbed → Torn**

The Veil should be recognizable without becoming a giant fantasy portal.

## Map

Required nodes:

**Longlat Gate → Settlement → Common Yard → Old Road → River → Sacred Landscape → Veil → Combat Arena → Return Route**

Every node needs:
- player entrance;
- exit;
- collision;
- one readable landmark;
- at least one reason to exist beyond decoration.

## UI

Persistent:
- movement controls
- attack
- dodge
- interaction prompt when relevant
- objective text
- health
- pause

Temporary:
- first-use control hint
- interaction prompt
- combat warning
- checkpoint/restart feedback

Do not fill the screen with tutorial cards.

## Audio

Layers:
- ordinary settlement ambience;
- road ambience;
- river ambience;
- quieter sacred/community area;
- directional distortion near Veil;
- brief silence;
- enemy sound;
- combat impacts.

Avoid using stereotyped “tribal” audio as shorthand for Africa.

## Save / Checkpoint

Minimum implementation:
- checkpoint after settlement investigation;
- checkpoint before first combat;
- restart after death;
- return to latest checkpoint;
- debug reset to beginning.

A full save system is not required for the vertical slice.

## Asset Strategy

Use placeholders where necessary.

Required prototype asset groups:
- player placeholder;
- 5–8 NPC placeholders;
- settlement structures;
- road props;
- river/bridge/ford;
- sacred/community-space placeholder;
- Veil;
- Veil-Torn;
- environmental props;
- UI icons.

Real-world cultural assets must have a reference record before they become final production assets.

## Acceptance Checklist

The slice is accepted only when a new player can:

- [ ] start without developer help;
- [ ] move and understand camera;
- [ ] identify Longlat as a lived settlement;
- [ ] notice an abnormal event;
- [ ] understand the old-road objective;
- [ ] reach the river without getting lost;
- [ ] recognize the Veil as abnormal;
- [ ] understand basic combat;
- [ ] read enemy telegraphs;
- [ ] survive or complete the first encounter;
- [ ] understand that the disturbance is larger than one location;
- [ ] restart after failure;
- [ ] finish in roughly 10–15 minutes.

## Prototype Metrics

Record:
- time to first movement;
- time to first interaction;
- time to objective;
- time to first Veil;
- time to first attack;
- deaths;
- failed dodges;
- abandoned objectives;
- places where players become lost;
- whether players can explain what happened.

## Build Rule

If a feature does not improve movement, exploration, discovery, combat, story clarity, or playtest learning for this slice, it waits.

**Build the slice. Play the slice. Then expand DOL.**
