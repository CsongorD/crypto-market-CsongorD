#!/bin/bash

flutter clean
flutter pub get
flutter pub upgrade
flutter config --enable-web

# This is fine for development only
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0
