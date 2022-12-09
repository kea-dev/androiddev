FROM ubuntu:22.04

RUN apt-get update && apt upgrade -y

# Used in the docker file
RUN apt-get install -y \
    unzip \
    curl

# Nice to have & Delicious
RUN apt-get install -y \
    git \
    gh \
    zsh

# Java Runtime Environment 
RUN apt-get install -y \
    openjdk-17-jre

# Gradle
RUN curl 'https://downloads.gradle-dn.com/distributions/gradle-7.4-bin.zip' > /gradle-7.4-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-7.4-bin.zip && \
    rm gradle-7.4-bin.zip
ENV PATH="/opt/gradle/gradle-7.4/bin:$PATH"

#Android Studio Command Line Tools
RUN curl 'https://dl.google.com/android/repository/commandlinetools-linux-9123335_latest.zip' > /commandlinetools-linux-9123335_latest.zip && \
    unzip commandlinetools-linux-9123335_latest.zip && \
    mkdir /opt/cmdline-tools/ && \
    mv cmdline-tools/ /opt/cmdline-tools/latest && \
    rm commandlinetools-linux-9123335_latest.zip
ENV PATH="/opt/cmdline-tools/latest/bin:$PATH"

# Oh-My-Zsh
RUN echo y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 32 bit compatabiliy on 64 bit architecture
RUN dpkg --add-architecture i386 && \
    apt-get install -y \
    libc6 \
    libncurses5 \
    libstdc++6 \
    libbz2-1.0
