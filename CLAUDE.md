# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter pub get      # Install dependencies
flutter run          # Run in debug mode
flutter analyze      # Lint (extends flutter_lints)
flutter test         # Run tests
flutter build apk    # Android release build
flutter build ios    # iOS release build
```

## Architecture

Single-screen Flutter app that displays diatonic chord progressions for any major key.

**Data flow**: `KeysDropdown` → `HomeScreen.selectedKey` → `KeyDegrees` → `Notes.buildChords()`

**State management**: Plain `StatefulWidget`. `MainApp` owns the theme brightness; `HomeScreen` owns the selected key. No state management library is used.

**Theme**: Material 3 with a `colorSchemeSeed`. Theme toggle is initiated in `CustomAppBar` and propagates up via an `onToggleTheme` callback to `MainApp`, which swaps `ThemeMode`.

**Music theory logic** lives entirely in `lib/data_structures/keys_data_structure/keys_data.dart` (`Notes` class):
- `useSharps(key)` — decides whether a key uses sharps or flats
- `buildChords(key)` — generates all 7 scale degrees using major-scale intervals (W W H W W W H), then calls `applyQuality()` and `applySlash()` to label each chord (major / minor / diminished, plus slash-chord variants for iii and vii)

**Widget tree**:
```
MainApp (theme state)
└── HomeScreen (selectedKey state)
    ├── CustomAppBar (theme toggle button)
    ├── KeysDropdown (emits new key)
    └── KeyDegrees (renders chord buttons for each degree)
```
