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

# Generate blogs from markdown
echo "Generating blogs into json"
dart run tool/generate_blogs_json.dart

# Build the app
echo "Building Jaspr app..."
jaspr build

echo "Jaspr build complete!"