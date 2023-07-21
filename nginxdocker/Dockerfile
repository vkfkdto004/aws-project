FROM nginx:1.22.0

RUN mkdir -p /static

RUN rm /etc/nginx/conf.d/default.conf
RUN rm /usr/share/nginx/html/index.html

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./index.html  /usr/share/nginx/html/index.html

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
