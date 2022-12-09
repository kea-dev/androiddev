FROM ubuntu:22.04

RUN apt-get update && apt upgrade -y

RUN apt-get install -y \
    unzip \
    curl \
    git \
    gh \
    zsh \
    openjdk-17-jre

RUN curl 'https://downloads.gradle-dn.com/distributions/gradle-7.4-bin.zip' > /gradle-7.4-bin.zip
RUN mkdir /opt/gradle
RUN unzip -d /opt/gradle gradle-7.4-bin.zip
ENV PATH="/opt/gradle/gradle-7.4/bin:$PATH"
RUN rm gradle-7.4-bin.zip

RUN curl 'https://dl.google.com/android/repository/commandlinetools-linux-9123335_latest.zip' > /commandlinetools-linux-9123335_latest.zip
RUN unzip commandlinetools-linux-9123335_latest.zip
RUN mkdir /opt/cmdline-tools/
RUN mv cmdline-tools/ /opt/cmdline-tools/latest
ENV PATH="/opt/cmdline-tools/latest/bin:$PATH"
RUN rm commandlinetools-linux-9123335_latest.zip
RUN echo y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 


RUN dpkg --add-architecture i386
RUN apt-get install -y \
    libc6 \
    libncurses5 \
    libstdc++6 \
    libbz2-1.0
