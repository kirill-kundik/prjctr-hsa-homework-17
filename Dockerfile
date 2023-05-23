FROM python:3.11-slim

# Install necessary packages
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" \
    TZ="Europe/Kyiv" \
    apt-get install -y \
    build-essential \
    iputils-ping \
    curl \
    apache2-utils \
    hping3 \
    netcat \
    siege

# Install Slowloris script
RUN curl -LO https://github.com/gkbrk/slowloris/raw/master/slowloris.py && \
    mv slowloris.py /usr/local/bin/slowloris && \
    chmod +x /usr/local/bin/slowloris

# Copy attack script to the container
COPY attack.sh /root/attack.sh

RUN chmod +x /root/attack.sh

# Set the entry point to execute the attack script
CMD ["/root/attack.sh"]
