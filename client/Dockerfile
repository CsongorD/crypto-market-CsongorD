# FROM ubuntu:latest
# RUN apt-get update && apt-get install -y \
#     git \
#     unzip \
#     xz-utils \
#     wget \
#     curl \
#     zip \
#     libglu1-mesa \ 
#     openjdk-8-jdk \
#     cmake \
#     ninja-build
# RUN useradd -ms /bin/bash developer
# WORKDIR /home/developer
# COPY . .
# # Install OpenJDK and Android SDK
# ENV ANDROID_HOME=/opt/android-sdk
# ENV PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
# RUN mkdir -p ${ANDROID_HOME} && cd ${ANDROID_HOME} && \
#     wget https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip && \
#     unzip commandlinetools-linux-7302050_latest.zip && \
#     rm commandlinetools-linux-7302050_latest.zip
# # Download Flutter SDK
# RUN git clone https://github.com/flutter/flutter.git
# ENV PATH "$PATH:/home/developer/flutter/bin"
# RUN chown -R developer:developer /home/developer
# USER developer
# RUN flutter clean
# RUN flutter pub get
# RUN flutter pub upgrade
# RUN flutter doctor
# RUN flutter devices
# # RUN flutter build apk
# EXPOSE 8080
# # Define the command to run your app
# CMD ["flutter", "run", "--release"]
#// 2 
# # Use an official Ubuntu image as the base
# FROM ubuntu:latest
# # Set environment variables for Android SDK
# ENV ANDROID_SDK_ROOT /opt/android-sdk
# ENV PATH $PATH:$ANDROID_SDK_ROOT/cmdline-tools/tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools
# # Set environment variables for Flutter
# ENV FLUTTER_HOME /opt/flutter
# ENV PATH $PATH:$FLUTTER_HOME/bin
# # Install necessary dependencies
# RUN apt-get update -y && \
#     apt-get install -y --no-install-recommends \
#     openjdk-8-jdk \
#     unzip \
#     wget \
#     lib32stdc++6 \
#     libstdc++6 \
#     && rm -rf /var/lib/apt/lists/*
# # Download and install Android SDK
# RUN wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip -O /tmp/android-sdk-tools.zip \
#     && mkdir -p $ANDROID_SDK_ROOT/cmdline-tools \
#     && unzip /tmp/android-sdk-tools.zip -d $ANDROID_SDK_ROOT/cmdline-tools \
#     && rm /tmp/android-sdk-tools.zip
# # Accept Android SDK licenses
# RUN yes | sdkmanager --licenses
# # Install Android SDK components
# RUN sdkmanager --update \
#     && sdkmanager "platform-tools" \
#     && sdkmanager "platforms;android-30" \
#     && sdkmanager "build-tools;30.0.3"
# # Download and install Flutter
# RUN wget https://flutter.dev/docs/get-started/install/linux -O flutter.tar.xz \
#     && tar xf flutter.tar.xz -C /opt \
#     && rm flutter.tar.xz
# # Add Flutter and Dart binaries to the PATH
# RUN ln -s $FLUTTER_HOME/bin/flutter /usr/local/bin/flutter \
#     && ln -s $FLUTTER_HOME/bin/dart /usr/local/bin/dart
# # Set the working directory
# WORKDIR /app
# # Copy only the pubspec.yaml and lock file to leverage Docker caching
# COPY pubspec.yaml pubspec.yaml
# COPY pubspec.lock pubspec.lock
# # Install dependencies
# RUN flutter pub get
# # Add the entire project to the container
# COPY . .
# # Copy the entrypoint script
# COPY entrypoint.sh /usr/local/bin/entrypoint.sh
# RUN chmod +x /usr/local/bin/entrypoint.sh
# # Set the entrypoint
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


#**********************************
# FROM ubuntu:latest

# # Set the working directory in the container
# USER root
# RUN useradd --create-home --shell /bin/bash dev && \
#     usermod -aG sudo dev

# WORKDIR /home/dev

# RUN chown -R dev:dev /home/dev

# # Install necessary dependencies
# RUN apt-get update -y && \
#     apt-get install -y \
#     openjdk-8-jdk \
#     unzip \
#     wget \
#     git \
#     curl \
#     libglu1-mesa \
#     cmake \
#     ninja-build \
#     clang \
#     pkg-config \
#     xz-utils \
#     zip \
#     lib32stdc++6 \
#     libstdc++6 \
#     libgtk-3-dev \
#     dpkg \
#     fonts-liberation \
#     libu2f-udev \
#     libvulkan1 \
#     xdg-utils

# ENV PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig

# # Set up environment variables for Android SDK
# ENV ANDROID_HOME /opt/android-sdk
# ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# # Download and install Android SDK
# RUN wget -q https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O android-sdk.zip && \
#     mkdir $ANDROID_HOME && \
#     unzip -q android-sdk.zip -d $ANDROID_HOME && \
#     rm android-sdk.zip

# # Accept the Android SDK licenses
# # RUN yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses
# # RUN /opt/android-sdk/tools/bin/sdkmanager --install  "cmdline-tools;latest" "platform-tools" "extras;android;m2repository" "extras;google;m2repository"
# # RUN /opt/android-sdk/tools/bin/sdkmanager --update

# # Accept the Android SDK licenses and install components
# RUN yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses && \
#     $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-29" "build-tools;29.0.3" "extras;android;m2repository" "platform-tools" "extras;google;m2repository" "cmdline-tools;latest"

# # Install Flutter and Dart
# RUN git clone https://github.com/flutter/flutter.git /home/dev/flutter
# ENV PATH="$PATH:/home/dev/flutter/bin"

# RUN flutter config --android-sdk $ANDROID_HOME
# # RUN flutter doctor --android-licenses | yes

# # Install Google Chrome
# RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
#     dpkg -i google-chrome-stable_current_amd64.deb && \
#     apt-get install -f
# ENV CHROME_EXECUTABLE=/usr/bin/google-chrome

# ENV FLUTTER_WEB_USE_SKIA=true

# USER root
# COPY . .
# USER dev
# # Set up the entrypoint script
# COPY entrypoint.sh /home/dev/entrypoint.sh
# USER root
# RUN chmod +x /home/dev/entrypoint.sh

# RUN flutter upgrade
# RUN flutter doctor -v

# RUN google-chrome --headless --disable-gpu --remote-debugging-port=9222 --no-sandbox --disable-software-rasterizer

# CMD [ "flutter",'run','-d','chrome','--headless' ]

# # Specify the entrypoint script
# # ENTRYPOINT ["sh","/home/dev/entrypoint.sh"]
#********************************

# Use Ubuntu as the base image
# FROM ubuntu:20.04

# # Set environment variables
# ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
# ENV ANDROID_HOME=/opt/android-sdk
# ENV FLUTTER_HOME=/opt/flutter
# ENV PATH=$PATH:$JAVA_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$FLUTTER_HOME/bin
# ENV DISPLAY=localhost:0.0

# # Install dependencies
# RUN apt-get update -y
# RUN apt-get install -y openjdk-8-jdk
# RUN apt-get install -y wget
# RUN apt-get install -y unzip
# RUN apt-get install -y git
# RUN apt-get install -y lib32stdc++6
# RUN apt-get install -y libglu1-mesa
# RUN apt-get install -y curl
# RUN apt-get install -y clang
# RUN apt-get install -y cmake
# RUN apt-get install -y ninja-build
# RUN apt-get install -y pkg-config
# RUN apt-get install -y libgtk-3-dev
# RUN apt-get install -y liblzma-dev
# RUN apt-get install -y libstdc++-10-dev
# RUN apt-get install -y x11-apps

# WORKDIR /home/dev
# COPY . .
# COPY entrypoint.sh /home/dev/entrypoint.sh

# RUN useradd -ms /bin/bash dev
# RUN chown -R dev:dev /home/dev /opt
# RUN chmod +x entrypoint.sh

# # Install Android SDK
# RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip -O android-sdk.zip 
# RUN unzip -q android-sdk.zip -d $ANDROID_HOME 
# RUN rm android-sdk.zip 
# RUN echo "y" | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_HOME --licenses

# USER dev

# # Install Flutter
# RUN git clone https://github.com/flutter/flutter.git $FLUTTER_HOME 
# RUN $FLUTTER_HOME/bin/flutter doctor

# # Set up Flutter environment
# RUN echo "export PATH=$PATH:$FLUTTER_HOME/bin" >> /home/dev/.bashrc
# RUN echo "export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools" >> /home/dev/.bashrc

# ENTRYPOINT ["sh","./entrypoint.sh"]



# MASODIK VERZIO


# FROM ubuntu:20.04

# ENV DEBIAN_FRONTEND="noninteractive"
# ENV JAVA_VERSION="11"
# ENV ANDROID_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip"
# ENV ANDROID_VERSION="30"
# ENV ANDROID_BUILD_TOOLS_VERSION="30.0.3"
# ENV ANDROID_ARCHITECTURE="x86_64"
# ENV ANDROID_SDK_ROOT="/usr/local/android-sdk"
# ENV FLUTTER_CHANNEL="stable"
# ENV FLUTTER_VERSION="2.8.0"
# ENV GRADLE_VERSION="7.3"
# ENV GRADLE_USER_HOME="/opt/gradle"
# ENV GRADLE_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
# ENV FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/$FLUTTER_CHANNEL/linux/flutter_linux_$FLUTTER_VERSION-$FLUTTER_CHANNEL.tar.xz"
# ENV FLUTTER_ROOT="/opt/flutter"
# ENV PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/platforms:$FLUTTER_ROOT/bin:$GRADLE_USER_HOME/bin:$PATH"

# # Install the necessary dependencies.
# RUN apt-get update \
#     && apt-get install --yes --no-install-recommends \
#     openjdk-$JAVA_VERSION-jdk \
#     curl \
#     unzip \
#     sed \
#     git \
#     bash \
#     xz-utils \
#     libglvnd0 \
#     ssh \
#     xauth \
#     x11-xserver-utils \
#     libpulse0 \
#     libxcomposite1 \
#     libgl1-mesa-glx \
#     && rm -rf /var/lib/{apt,dpkg,cache,log}

# # Install Gradle.
# RUN curl -L $GRADLE_URL -o gradle-$GRADLE_VERSION-bin.zip \
#     && apt-get install -y unzip \
#     && unzip gradle-$GRADLE_VERSION-bin.zip \
#     && mv gradle-$GRADLE_VERSION $GRADLE_USER_HOME \
#     && rm gradle-$GRADLE_VERSION-bin.zip

# # # Install the Android SDK.
# # RUN mkdir /root/.android \
# #     && touch /root/.android/repositories.cfg \
# #     && mkdir -p $ANDROID_SDK_ROOT \
# #     && curl -o android_tools.zip $ANDROID_TOOLS_URL \
# #     && unzip -qq -d "$ANDROID_SDK_ROOT" android_tools.zip \
# #     && rm android_tools.zip \
# #     && mv $ANDROID_SDK_ROOT/cmdline-tools $ANDROID_SDK_ROOT/latest \
# #     && mkdir -p $ANDROID_SDK_ROOT/cmdline-tools \
# #     && mv $ANDROID_SDK_ROOT/latest $ANDROID_SDK_ROOT/cmdline-tools/latest \
# #     && yes "y" | sdkmanager "build-tools;$ANDROID_BUILD_TOOLS_VERSION" \
# #     && yes "y" | sdkmanager "platforms;android-$ANDROID_VERSION" \
# #     && yes "y" | sdkmanager "platform-tools"

# # Install Flutter.
# RUN curl -o flutter.tar.xz $FLUTTER_URL \
#     && mkdir -p $FLUTTER_ROOT \
#     && tar xf flutter.tar.xz -C /opt/ \
#     && rm flutter.tar.xz \
#     && git config --global --add safe.directory /opt/flutter \
#     && flutter config --no-analytics \
#     && flutter precache \
#     && yes "y" | flutter doctor --android-licenses \
#     && flutter doctor \
#     && flutter update-packages


# Use the official Flutter image as base
FROM ghcr.io/cirruslabs/flutter:3.24.3



# Set the working directory inside the container
WORKDIR /home/dev

# Copy the current directory contents into the container
COPY . .

# Copy the entrypoint.sh script into the container
# COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint.sh script executable
# RUN chmod +x /entrypoint.sh

# Expose the port for the Flutter web server
EXPOSE 8080

# Define the entrypoint
# ENTRYPOINT ["entrypoint.sh"]
ENTRYPOINT ["sh","./entrypoint.sh"]
