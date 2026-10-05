# Android Prototype Export

Dawn of Longlat's first prototype targets Godot 4.7.2 and keeps the gameplay layer mobile-first.

## Current status

- Android layout: planned/configured at the prototype design level
- Android export: not verified in this development environment
- Desktop runtime: not verified in this development environment
- Touch controls: part of the prototype scene contract

## Export prerequisites

For a local Godot 4.7.2 export, install:

1. Godot 4.7.2 stable.
2. OpenJDK 17.
3. Android SDK with Platform-Tools 35.0.0+, Build-Tools 35.0.1, Android Platform 35, Command-line Tools, CMake 3.10.2.4988404, and NDK r28b (28.1.13356709), following the Godot 4.7 export guidance.
4. Godot's matching Android export templates. citeturn0search0turn0search3

Then configure the Android SDK/JDK paths in Editor > Editor Settings > Export > Android.

## Prototype export checklist

- Open the DOL project.
- Confirm res://scenes/prototype/main.tscn is the main scene.
- Add an Android export preset.
- Use an orientation consistent with the prototype layout.
- Confirm the touch buttons remain reachable on the target aspect ratio.
- Export a debug APK.
- Install on a physical Android device.
- Test movement, attack, dodge, interaction, combat, defeat and restart.
- Record device model, Android version, FPS observations and input problems.

## Important

Do not treat a successful desktop run as proof that the Android build is correct. The first real device test is a separate acceptance gate.

## Next Android pass

After the first device export works, add:

- safe-area-aware touch controls
- aspect-ratio testing
- pause/resume handling
- Android back-button behavior
- performance profiling on a low/mid-range device
- release signing only after gameplay stability
