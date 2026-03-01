# Building LoliSnatcher from Source

This guide covers how to build LoliSnatcher locally for development and testing.

## Prerequisites

### Flutter SDK

See `pubspec.yaml` for currently used Flutter SDK version

1. Install Flutter following the [official guide](https://docs.flutter.dev/get-started/install)
2. Verify installation:
   ```bash
   flutter --version
   flutter doctor
   ```

### Dart SDK

See `pubspec.yaml` for currently used Dart SDK version

## Clone and Setup

```bash
# Clone the repository
git clone https://github.com/NO-ob/LoliSnatcher_Droid.git
cd LoliSnatcher_Droid

# Install dependencies
flutter pub get
```

## Build Commands

### Android

```bash
# Build APK for manual install
sh ./build.sh
```

Output locations:
- APK: `build/app/outputs/flutter-apk/LoliSnatcher_[version]_[build]_[arch]_[store/github/test].apk`

## Running in Debug Mode

```bash
# Run app on connected device/emulator
flutter run

# Run on specific device
flutter devices              # List available devices
flutter run -d <device_id>   # Run on specific device
```

## Code Generation

Some features (i.e. localization changes) require code generation. Run after modifying relevant files:

```bash
# Generate localization types (after editing i18n JSON files)
dart run ./loc_build.dart

# General build runner (if needed)
dart run build_runner build
```

## IDE Setup

### VS Code

1. Install [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) and [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) extensions
2. Open the project folder
3. VS Code will detect Flutter project automatically
4. Use `F5` to run/debug

## Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Our Discord](https://discord.gg/yD47ANdEXW) for help
