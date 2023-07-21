FROM nginx:latest

RUN rm -rf /etc/nginx/conf.d/default.conf
RUN rm -rf /usr/share/nginx/html/index.html

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./index.html  /usr/share/nginx/html/index.html

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
