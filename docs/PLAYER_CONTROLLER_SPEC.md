# DOL Prototype Player Controller Specification

## Goal

Create a responsive mobile-first controller that makes the first combat and exploration sequence immediately understandable.

## Movement

Required:
- 8-direction movement;
- responsive acceleration/deceleration;
- collision against world geometry;
- no accidental movement after releasing input.

For touch:
- virtual movement stick or equivalent;
- large touch target;
- sensible dead zone;
- no unnecessary UI animation.

## Camera

Required:
- readable player framing;
- smooth follow;
- collision-aware behavior where needed;
- camera must not obscure enemy telegraphs.

The camera is a gameplay system, not only presentation.

## Combat Input

Minimum:
- Light Attack
- Dodge
- Interact

Optional:
- Defense/parry
- Signature ability

Do not implement optional systems if they delay the first playable build.

## Attack

Light attack must have:
1. input;
2. anticipation;
3. active hit window;
4. recovery.

The player must not be able to cancel every action instantly.

## Dodge

Dodge must have:
- clear input;
- short movement burst;
- recovery;
- enough invulnerability to teach timing without trivializing combat.

Do not make dodge infinite or completely safe.

## Interaction

Interaction prompt appears only when relevant.

Examples:
**Talk** · **Inspect** · **Cross** · **Enter**

One interaction action should handle all prototype interactions.

## Health

Prototype:
- player health;
- enemy health;
- damage feedback;
- death state;
- checkpoint restart.

No complex status effects.

## Feedback

Every important action needs at least two readable signals where practical:
- visual;
- audio;
- animation;
- haptic on supported devices.

Combat attacks must never rely only on tiny visual effects.

## Mobile Performance

Target:
- stable frame pacing;
- responsive input;
- minimal allocations during combat;
- simple collision;
- limited active entities.

Performance should be measured on a realistic Android device before visual polish.

## Debug Controls

Developer build should expose:
- reset scene;
- teleport to zones;
- restore health;
- spawn Veil-Torn;
- toggle invulnerability;
- show collision;
- show FPS/performance data.

Debug tools are development-only.

## Acceptance

Controller is ready when:
- movement feels predictable;
- camera does not fight input;
- attack connects reliably;
- dodge can evade a telegraphed attack;
- interaction works consistently;
- death/restart works;
- a first-time player can understand controls without a manual.
