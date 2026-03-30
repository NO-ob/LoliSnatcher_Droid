#!/usr/bin/env python3
"""
Script to bump the build number in pubspec.yaml and lib/src/data/constants.dart
"""
import re
import sys

def bump_version():
    # Read pubspec.yaml
    with open('pubspec.yaml', 'r', encoding='utf-8') as f:
        pubspec_content = f.read()

    # Extract current version
    version_match = re.search(r'version:\s*(\d+\.\d+\.\d+)\+(\d+)', pubspec_content)
    if not version_match:
        print("Error: Could not find version in pubspec.yaml", file=sys.stderr)
        sys.exit(1)

    version_name = version_match.group(1)
    build_number = int(version_match.group(2))

    # Increment build number
    new_build_number = build_number + 1
    new_version_string = f"{version_name}+{new_build_number}"

    print(f"Bumping version from {version_name}+{build_number} to {new_version_string}")

    # Update pubspec.yaml
    new_pubspec_content = re.sub(
        r'version:\s*\d+\.\d+\.\d+\+\d+.*',
        f'version: {new_version_string} # remember to update the values in constants.dart->updateInfo after changing them here',
        pubspec_content
    )

    with open('pubspec.yaml', 'w', encoding='utf-8') as f:
        f.write(new_pubspec_content)

    # Read constants.dart
    with open('lib/src/data/constants.dart', 'r', encoding='utf-8') as f:
        constants_content = f.read()

    # Update constants.dart - version name
    constants_content = re.sub(
        r"versionName:\s*'[\d.]+',",
        f"versionName: '{version_name}',",
        constants_content
    )

    # Update constants.dart - build number
    constants_content = re.sub(
        r'buildNumber:\s*\d+,',
        f'buildNumber: {new_build_number},',
        constants_content
    )

    # Update constants.dart - title
    constants_content = re.sub(
        r"title:\s*'[\d.]+',",
        f"title: '{version_name}',",
        constants_content
    )

    with open('lib/src/data/constants.dart', 'w', encoding='utf-8') as f:
        f.write(constants_content)

    # Save version info for later steps
    with open('version_name.txt', 'w') as f:
        f.write(version_name)
    with open('build_number.txt', 'w') as f:
        f.write(str(new_build_number))

    print(f"Successfully bumped version to {new_version_string}")
    print(f"Updated files: pubspec.yaml, lib/src/data/constants.dart")

if __name__ == '__main__':
    bump_version()
