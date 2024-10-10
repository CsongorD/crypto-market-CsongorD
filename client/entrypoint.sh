#!/bin/bash

# Running flutter clean
flutter clean

# Fetch Flutter dependencies
flutter pub get
flutter pub upgrade

# Enable Flutter web support
flutter config --enable-web

# Running the Flutter web app on port 8080
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0