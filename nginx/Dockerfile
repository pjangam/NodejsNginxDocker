FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-available/default
RUN rm /etc/nginx/conf.d/default.conf