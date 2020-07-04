# FROM ubuntu:18.04

# # Prerequisites open-jdk is required by android sdk
# # wget us used to dowload android tools
# RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# # Set up new user
# RUN useradd -ms /bin/bash developer
# USER developer
# WORKDIR /home/developer

# # Prepare Android directories and system variables
# RUN mkdir -p Android/sdk
# ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
# RUN mkdir -p .android && touch .android/repositories.cfg

# # Set up Android SDK
# RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
# RUN unzip sdk-tools.zip && rm sdk-tools.zip
# RUN mv tools Android/sdk/tools
# RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
# RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
# ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"

# # Download Flutter SDK
# RUN git clone https://github.com/flutter/flutter.git
# ENV PATH "$PATH:/home/developer/flutter/bin"

# # Run basic check to download Dark SDK
# RUN flutter doctor
# # RUN flutter pub get
# # RUN flutter run -t lib/main_dev.dart -d chrome

#Stage 1 - Install dependencies and build the app
FROM debian:latest AS build-env

# Install flutter dependencies
RUN apt-get update 
RUN apt-get install -y curl git wget zip unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

#Run flutter doctor and set path
RUN /usr/local/flutter/bin/flutter doctor -v
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

#Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web


# Copy files to container and build
RUN mkdir /usr/local/highfivesui
COPY . /usr/local/highfivesui
WORKDIR /usr/local/highfivesui
RUN flutter pub get
RUN /usr/local/flutter/bin/flutter build web -t lib/main_dev.dart


#Stage 2 - Create the run-time image
FROM nginx:latest
COPY --from=build-env /usr/local/highfivesui/build/web /usr/share/nginx/html

