#!/usr/bin/env bash
set -e

# Install Flutter SDK
echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:$PWD/flutter/bin"

# Precache Flutter web
echo "Setting up Flutter for web..."
flutter config --enable-web
flutter precache --web

# Verify installation
flutter --version
flutter doctor

# Install dependencies
echo "Installing dependencies..."
flutter pub get

# Build the app
echo "Building Jaspr app..."
dart run jaspr build

echo "Build complete!"