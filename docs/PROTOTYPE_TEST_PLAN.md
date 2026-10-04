# DOL Prototype Test Plan

## Purpose

Test whether the first DOL slice is actually playable, understandable, and culturally responsible before adding content.

## Test Group A — Controls

Questions:
- Can a new player move immediately?
- Can they stop accurately?
- Can they understand camera behavior?
- Can they attack without explanation?
- Can they dodge a visible attack?
- Can they interact with an NPC?

Pass:
- no developer intervention required.

## Test Group B — Navigation

Questions:
- Can players find the old road?
- Can they recognize the river as the next landmark?
- Can they identify the Veil?
- Do optional paths confuse the critical route?

Record:
- wrong turns;
- backtracking;
- pauses;
- requests for directions.

## Test Group C — Combat

Questions:
- Do players understand enemy attacks?
- Do telegraphs arrive early enough?
- Does dodge feel useful?
- Does Veil Pulse read as different from a normal attack?
- Is the fight too easy or too punishing?

Record:
- time to first hit;
- damage taken;
- dodges;
- deaths;
- repeated failed behavior.

## Test Group D — Story

After the slice, ask without prompting:
1. Where were you?
2. What seemed wrong?
3. Why did you go to the old road?
4. What happened at the Veil?
5. What do you think happens next?

Good result:
Player answers are imperfect but converge on the intended experience.

## Test Group E — World Believability

Ask:
- Did the settlement feel inhabited?
- Did spaces appear useful?
- Did NPCs feel like people rather than lore dispensers?
- Did the supernatural contrast with ordinary life?
- Did anything feel like a generic “African fantasy” set?

Any strong stereotype signal becomes a design issue.

## Test Group F — Cultural Review

Before final art or release:
- verify researched cultural references;
- check community/context attribution;
- distinguish documented material from DOL-original invention;
- review sacred/religious representations;
- remove unsupported universal claims.

## Test Loop

**Build → Observe → Record → Fix → Retest**

Do not defend a feature because it took time to build.

## Exit Criteria

The prototype moves forward when:
- controls are reliable;
- critical path is readable;
- combat is understandable;
- story is comprehensible;
- performance is acceptable on target Android hardware;
- no major cultural representation issue remains unresolved.

## Bug Severity

### P0 — Blocking
Game cannot start, progress, fight, or finish.

### P1 — Major
Core interaction unreliable or player frequently becomes stuck.

### P2 — Normal
Visual, audio, navigation, or balance issue with workaround.

### P3 — Polish
Minor presentation issue.

Fix P0/P1 before adding new content.
