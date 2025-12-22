#!/usr/bin/env bash
set -e

# Install Flutter SDK
echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:$PWD/flutter/bin"

# Activate Jaspr CLI
echo "Activating Jaspr CLI..."
dart pub global activate jaspr_cli

# Add pub cache to PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Build the app
echo "Building Jaspr app..."
jaspr build

echo "Jaspr build complete!"