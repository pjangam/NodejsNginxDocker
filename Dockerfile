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
  && curl -sL https://deb.nodesource.com/setup_4.x | bash -  > node.deb \
  && dpkg -i node.deb \
  && rm node.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf

npm install -g forever

RUN git clone -v --recurse-submodules --progress --branch pricelineNetRatesSearch "git@github.com:TaviscaSolutions/connector-hotels-priceline-netrates.git" pricelineConnector 

CD pricelineConnector
RUN npm install --production
RUN forever start bin/www -e crashlogs.txt

COPY default /etc/nginx/sites-available/default

RUN nginx -s reload
EXPOSE 80