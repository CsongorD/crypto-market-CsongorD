FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    xz-utils \
    wget \
    curl \
    zip \
    libglu1-mesa \ 
    openjdk-8-jdk \
    cmake \
    ninja-build

RUN useradd -ms /bin/bash developer

WORKDIR /home/developer

COPY . .

# Install OpenJDK and Android SDK
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN mkdir -p ${ANDROID_HOME} && cd ${ANDROID_HOME} && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip && \
    unzip commandlinetools-linux-7302050_latest.zip && \
    rm commandlinetools-linux-7302050_latest.zip


# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/developer/flutter/bin"


RUN chown -R developer:developer /home/developer
USER developer


RUN flutter clean
RUN flutter pub get
RUN flutter pub upgrade
RUN flutter doctor
RUN flutter devices
RUN flutter build apk
RUN flutter run


EXPOSE 8080

# Define the command to run your app
CMD ["flutter", "run", "--release", "--dart-define=FLUTTER_WEB_USE_SKIA=true", "--no-sound-null-safety"]
