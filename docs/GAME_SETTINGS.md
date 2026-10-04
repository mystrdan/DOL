# Game Settings — DOL

## Purpose

Game settings are a first-class part of Dawn of Longlat, not an afterthought. The settings system should serve both mobile and desktop players while staying quiet, readable, and lightweight.

Godot stores project-level settings in `project.godot`, while player-facing options should be handled by the game's own Settings UI and saved separately as user preferences. citeturn0search0

## Prototype settings

### Gameplay / accessibility
- Screen shake: On / Off
- Touch controls: On / Auto
- Haptic feedback: On / Off
- Tutorial hints: On / Off

### Audio
- Master volume
- Music volume
- SFX volume

### Display
- Fullscreen: On / Off on desktop
- Display scaling should preserve the game's intended aspect ratio.
- Mobile should remain edge-to-edge where supported without making critical HUD controls unreachable.

### Controls
- Desktop: WASD / arrow movement, J attack, Space dodge, E interact, R restart during prototype.
- Controller support should use Godot InputMap actions rather than hardcoded device-specific paths. Godot supports keyboard, controller, and remappable input actions. citeturn0search1turn0search2
- Mobile controls remain touch-first.

### Language
- Start with English.
- Build UI text through localization-ready strings from the beginning.
- Do not add invented African-language translations.

## Pause menu

The in-game pause menu should eventually contain:

**Resume**
**Settings**
**Restart Checkpoint**
**Quit to Title**

Settings should open as a focused panel rather than taking the player into an editor-like screen.

## Persistence

Player-facing settings should persist between sessions.

Recommended first implementation:
- `user://settings.cfg`
- load on startup
- save immediately after a setting changes
- safe defaults when the file does not exist

Do not store save-game progress in the same settings file.

## Design rules

- No excessive sliders or options before they solve a real player need.
- No graphics settings that expose engine internals to normal players.
- No separate “mobile settings” screen; device-specific controls should adapt automatically.
- Never make vibration, audio, or screen effects mandatory.
- Settings must remain usable with touch, mouse, and controller where applicable.
- Critical settings must have clear labels and visible current state.


## Settings implementation order

### Phase A — Prototype
- Screen shake
- Touch controls
- Settings panel
- Persistent preferences

### Phase B — First playable build
- Master volume
- Music volume
- SFX volume
- Haptic feedback
- Tutorial hints

### Phase C — Production
- Language
- Subtitles/text accessibility
- Control remapping
- Graphics quality
- Frame-rate options

Do not implement Phase C options merely because the engine supports them.

## Future settings

Only add these when the game needs them:
- language selection
- subtitle size
- text speed
- color/contrast options
- aim/targeting assistance
- control remapping
- graphics quality presets
- frame-rate limit
- vibration intensity

## Project-level baseline

The current prototype baseline is:
- 1280×720 viewport
- canvas-item scaling with preserved aspect ratio
- Compatibility renderer
- 60 FPS cap
- touch emulation from mouse for desktop testing
- unfocused gamepad input ignored

These are development defaults, not final platform requirements.

## Acceptance criteria

A settings pass is complete when:
1. settings can be opened without leaving gameplay;
2. changes visibly take effect;
3. settings persist after restarting;
4. controls remain usable after display scaling;
5. mobile touch targets remain accessible;
6. no setting creates a crash or soft-lock;
7. the UI is readable without overwhelming the game.

## Principle

**Settings should give players control without making DOL feel like a configuration utility.**
