#!/usr/bin/env bash
set -e

# Download and install Dart SDK
echo "Installing Dart..."
curl -o dart.zip https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip
unzip -q dart.zip
export PATH="$PATH:$PWD/dart-sdk/bin"

# Verify installation
dart --version

# Install dependencies
echo "Installing dependencies..."
dart pub get

# Build the app
echo "Building Jaspr app..."
dart run jaspr build

echo "Build complete!"