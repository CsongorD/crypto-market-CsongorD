#!/bin/bash

echo "run flutter version"
flutter --version

echo "run flutter devices"
flutter devices

echo "run flutter doctor"
flutter doctor

echo "get dependencies"
flutter pub get

echo "start flutter"
flutter run



# # Connect to the Android emulator container.
# adb connect emulator:5555

# #List the available Flutter devices. You should see the connected dockerized emulator.
# flutter devices

# echo 'ide eljut'
# # Install the Flutter packages.
# flutter pub get
# flutter pub global activate dart-sdk 3.2


# # Run the Flutter app on the connected emulator.
# # Add `--trace-startup` to stop the Flutter process from blocking the terminal.
# flutter run --trace-startup

# mkdir -p 'screenshots' || exit 1

# # Take a screenshot of the Flutter app.
# adb shell screencap /sdcard/screenshot.png

# adb pull /sdcard/screenshot.png screenshots/flutter-screen.png