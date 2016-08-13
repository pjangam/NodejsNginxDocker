FROM nginx:1.9

ENV NODE_VERSION 5.10.1

RUN apt-get update \
  && apt-get install --assume-yes --no-install-recommends\
    apt-transport-https \
    bzip2 \
    curl \
    git \
    rlwrap \
    vim \
    apt-utils \
  && curl -sL https://deb.nodesource.com/setup_4.x | bash - \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-available/default
RUN rm /etc/nginx/conf.d/default.conf

RUN npm install -g forever

COPY pricelineConnector pricelineConnector 

RUN cd pricelineConnector ; npm install --production ; forever start bin/www -e crashlogs.txt ; service nginx start ; nginx -s reload
EXPOSE 80