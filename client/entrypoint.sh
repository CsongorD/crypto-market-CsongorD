##!/bin/bash


# flutter upgrade
# flutter doctor -v

# google-chrome --headless --disable-gpu --remote-debugging-port=9222 --no-sandbox --disable-software-rasterizer
# unset DISPLAY
# unset XDG_RUNTIME_DIR

# flutter run -d chrome --headless


#!/bin/sh

# flutter devices
# flutter doctor
# echo $DISPLAY

# echo "Running Flutter app!"
# flutter run -d linux

# Additional error handling can be added based on your specific use case
# For example, if you want to exit the container if the Flutter command fails:
# flutter run || exit 1


#!/bin/bash

# Echo starting message
# echo "Starting the ENTRYPOINT.SH File..."
# echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
# Navigate to the working directory
# echo "Changing directory to /home/dev..."
# cd /home/dev

# # Exit immediately if a command exits with a non-zero status.
# set -e

# Print commands and their arguments as they are executed.


# echo "Running flutter clean..."
# echo "------------------------------------------------------"
# RUN flutter clean
# echo "------------------------------------------------------"
# # ls
# # Fetch Flutter dependencies
# echo "Running 'flutter pub get' to install dependencies..."
# echo "------------------------------------------------------"
# flutter pub get
# echo "------------------------------------------------------"

# echo "Running flutter pub upgrade..."
# echo "------------------------------------------------------"
# flutter pub upgrade
# echo "------------------------------------------------------"

# # Enable Flutter web support
# echo "Running flutter config --enable-web..."
# echo "------------------------------------------------------"
# flutter config --enable-web
# echo "------------------------------------------------------"


# echo "Running flutter doctor..."
# echo "------------------------------------------------------"
# flutter doctor
# echo "------------------------------------------------------"

# echo "Running flutter devices..."
# echo "------------------------------------------------------"
# flutter devices
# echo "------------------------------------------------------"


# # Run the Flutter app on web-server
# echo "Running the Flutter app on linux..."
# echo "------------------------------------------------------"
# flutter run -d linux --web-port 8081 --web-hostname 0.0.0.0
# echo "------------------------------------------------------"

#!/bin/bash

echo "Starting the ENTRYPOINT.SH File..."

# Running flutter clean
flutter clean

# Fetch Flutter dependencies
flutter pub get
flutter pub upgrade

# Enable Flutter web support
flutter config --enable-web

# Running the Flutter web app on port 8080
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0