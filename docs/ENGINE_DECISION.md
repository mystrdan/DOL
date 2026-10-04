# DOL Engine Decision

## Decision

For the first playable prototype, DOL will use **Godot 4.7.2 stable** with GDScript.

Godot 4.7.2 is the current stable Godot 4 release as of October 2026. The official archive lists 4.7.2 as stable (18 August 2026); 4.8 remains a development branch. citeturn0search0turn0search9

## Why Godot

- Lightweight for a small prototype.
- Strong fit for mobile-first development.
- GDScript keeps iteration fast.
- Android export is supported.
- Open-source engine reduces licensing dependency.
- The prototype does not require heavyweight enterprise tooling.

## Why not lock to a bleeding-edge release?

The current 4.8 line is development-stage. The first prototype should optimize for stability and iteration, so the project pins its initial target to 4.7.2 rather than a development build.

## Scope

This is a prototype decision, not a permanent commitment to every future DOL release.

If the game later requires a different engine for a demonstrated technical reason, the decision can be revisited.

**Prototype first. Evidence first. Then scale.**
