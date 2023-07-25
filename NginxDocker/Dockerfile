FROM nginx:1.24.0

RUN rm -rf /etc/nginx/conf.d/default.conf
RUN rm -rf /usr/share/nginx/html/*

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./assets /usr/share/nginx/html/assets

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
