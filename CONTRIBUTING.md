# Contributing to LoliSnatcher

Thank you for your interest in contributing to LoliSnatcher! This document provides guidelines and instructions for contributing.

## Getting Started

### Fork and Clone

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/LoliSnatcher_Droid.git
   cd LoliSnatcher_Droid
   ```
3. Add the upstream remote:
   ```bash
   git remote add upstream https://github.com/NO-ob/LoliSnatcher_Droid.git
   ```

### Create a Branch

Create a feature branch from `develop`:
```bash
git checkout develop
git pull upstream develop
git checkout -b feature/your-feature-name
```

## Development Setup

### Prerequisites

- **Flutter SDK** (Check version in `pubspec.yaml`)
- **Dart SDK** (Check version in `pubspec.yaml`)
- **Android SDK** (for Android builds)
- **Visual Studio Build Tools** (for Windows builds)

For detailed build instructions, see [BUILDING.md](.github/BUILDING.md).

## Pull Request Process

1. **Branch from `develop`** - Always create your feature branch from the latest `develop`

2. **Follow code style** - The project uses `flutter_lints`. Run analysis before submitting:
   ```bash
   dart analyze
   ```

3. **Test your changes** - Ensure the app builds and runs correctly:
   ```bash
   flutter build apk --debug
   ```

4. **Commit with clear messages** - Use descriptive commit messages explaining what and why

5. **Submit PR**
   - Create a pull request against `develop` with:
   - Clear description of changes
   - Screenshots/videos for UI changes
   - Reference to related issues (if any)

## Localization / Translations

LoliSnatcher uses the [slang](https://pub.dev/packages/slang) package for internationalization code and [weblate]() for community translations.

### Translation Files

Translation files are located in `assets/i18n/`:
- `en.json` - English (base language)

### Adding a New Language

1. Create a new file `assets/i18n/xx-XX.json` (where xx-XX is the language code)
2. Copy the structure from `en.json` and translate all strings
3. Register the locale in the app configuration
4. Run `sh loc_build.sh` to regenerate types

## Reporting Bugs

When reporting bugs, please include:

1. **App version** - Found in Settings, on the bottom of the page
2. **Device information** - OS version, device model
3. **Steps to reproduce** - Clear steps to trigger the bug
4. **Expected behavior** - What should happen
5. **Actual behavior** - What actually happens
6. **Screenshots/logs** - If applicable

Use [GitHub Issues](https://github.com/NO-ob/LoliSnatcher_Droid/issues) to report bugs.

## Feature Requests

For new features:

1. **Discuss first** - Join the [Discord server](https://discord.gg/yD47ANdEXW) to discuss your idea
2. **Check existing issues** - Your idea may already be requested or in progress
3. **Open an issue** - Describe the feature, use case, and potential implementation, if possible

## Questions?

- Join the [Discord server](https://discord.gg/yD47ANdEXW) for help and discussions
- Check existing issues and documentation before asking
