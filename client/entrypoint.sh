##!/bin/bash


# flutter upgrade
# flutter doctor -v

# google-chrome --headless --disable-gpu --remote-debugging-port=9222 --no-sandbox --disable-software-rasterizer
# unset DISPLAY
# unset XDG_RUNTIME_DIR

# flutter run -d chrome --headless


#!/bin/sh

flutter devices
flutter doctor
echo $DISPLAY

echo "Running Flutter app!"
flutter run -d linux

# Additional error handling can be added based on your specific use case
# For example, if you want to exit the container if the Flutter command fails:
# flutter run || exit 1
