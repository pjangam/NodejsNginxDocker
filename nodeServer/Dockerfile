# Set the base image to Ubuntu
FROM    ubuntu

# File Author / Maintainer
MAINTAINER Tavisca Solutions

# Install Node.js and other dependencies
RUN apt-get update \
    && apt-get -y install curl apt-utils \
    && curl -sL https://deb.nodesource.com/setup_4.x | bash - \
    && apt-get -y install python build-essential \
    && apt-get install -y nodejs \

  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install forever
RUN npm install -g forever

# Add code files
# NOTE: remove test folder
ADD connectorpackage src
RUN cd /src && npm install --production

# Define working directory
WORKDIR /src
ADD . /src

RUN ls

# Expose port
EXPOSE  3000

# Run app using forever
CMD forever /src/bin/www

