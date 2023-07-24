#tomcat 
FROM tomcat:9.0.75

RUN rm -rf /usr/local/tomcat/conf/context.xml
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN rm -rf /usr/local/tomcat/conf/server.xml


COPY ./mysql-connector-j-8.0.23.jar /usr/local/tomcat/lib/mysql-connector-j-8.0.23.jar
COPY ./index.jsp /usr/local/tomcat/webapps/index.jsp
COPY ./main.jsp /usr/local/tomcat/webapps/main.jsp

COPY ./commons-pool2-2.4.2.jar /usr/local/tomcat/lib/commons-pool2-2.4.2.jar
COPY ./commons-logging-1.2.jar /usr/local/tomcat/lib/commons-logging-1.2.jar
COPY ./jedis-2.9.0.jar /usr/local/tomcat/lib/jedis-2.9.0.jar
COPY ./tomcat-cluster-redis-session-manager-2.0.4.jar /usr/local/tomcat/lib/tomcat-cluster-redis-session-manager-2.0.4.jar
COPY ./redis-data-cache.properties /usr/local/tomcat/conf/redis-data-cache.properties

EXPOSE 8080
