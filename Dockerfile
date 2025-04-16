FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    git \
    subversion \
    pkg-config \
    libncurses5-dev \
    libssl-dev \
    libxml2-dev \
    libsqlite3-dev \
    libjansson-dev \
    libedit-dev \
    libsrtp2-dev \
    libopus-dev \
    uuid-dev \
    && apt-get clean

# Download Asterisk tarball
RUN cd /usr/src && \
    wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-22-current.tar.gz

# Extract the tarball
RUN cd /usr/src && \
    tar -xvf asterisk-22-current.tar.gz

# Set working directory
WORKDIR /usr/src/asterisk-22.2.0

# Configure, make and install Asterisk
RUN ./configure && \
    make && \
    make install && \
    make samples && \
    make config

# Expose common Asterisk ports
EXPOSE 5060/udp 5060/tcp 5061/tcp 10000-20000/udp

# Set volume for configuration
VOLUME /etc/asterisk

# Command to start Asterisk
CMD ["/usr/sbin/asterisk", "-f", "-vvvv"]
