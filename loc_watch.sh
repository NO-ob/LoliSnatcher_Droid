#!/usr/bin/env bash
set -e

# Use the same generator and plural adaptation as a normal localization build.
if command -v fvm >/dev/null 2>&1; then
    exec fvm dart run ./loc_build.dart --watch
else
    exec dart run ./loc_build.dart --watch
fi
