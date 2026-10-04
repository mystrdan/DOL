# DOL Prototype UI / HUD Specification

## Principle

The interface should support the world, not compete with it.

## Persistent HUD

Show:
- health;
- objective;
- touch controls;
- pause.

Do not show:
- minimap by default;
- currency;
- inventory;
- quest log;
- giant ability bars;
- mythology encyclopedia during play.

## Objective

Use one short line.

Examples:
- **Investigate the old road.**
- **Reach the river.**
- **Find the damaged Veil.**
- **Return to Longlat.**

Objective updates should be obvious but brief.

## Interaction Prompt

Appears near the relevant object/NPC.

Examples:
- TALK
- INSPECT
- CROSS
- RETURN

The prompt should disappear immediately after the interaction becomes invalid.

## Tutorial Hints

Teach through action:
1. show;
2. let player try;
3. confirm;
4. remove hint.

Hints should not permanently occupy the HUD.

## Combat Feedback

Player:
- health damage;
- hit confirmation;
- dodge feedback.

Enemy:
- attack telegraph;
- hit reaction;
- Veil Pulse warning;
- defeat state.

## Dialogue

Short text boxes.
- readable font;
- clear speaker;
- limited text per page;
- tap/advance;
- skip/close where appropriate.

Dialogue must never trap the player in a long lecture during the prototype.

## Accessibility

Where feasible:
- adjustable text size;
- clear contrast;
- visual + audio telegraphs;
- reduced screen clutter;
- readable controls;
- no essential information conveyed by color alone.

## Visual Direction

Use the established DOL direction:
- restrained;
- dark/grounded UI;
- no excessive gradients;
- no excessive animation;
- no fantasy-game clutter.

The UI should feel like part of one coherent game rather than a collection of widgets.
