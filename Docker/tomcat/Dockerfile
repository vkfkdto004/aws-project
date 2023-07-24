FROM tomcat:9.0.75

RUN rm -rf /usr/local/tomcat/conf/context.xml
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN rm -rf /usr/local/tomcat/conf/server.xml

COPY ./context.xml /usr/local/tomcat/conf/context.xml
COPY ./server.xml /usr/local/tomcat/conf/server.xml
COPY ./mysql-connector-java-8.0.23.jar /usr/local/tomcat/lib/mysql-connector-java-8.0.23.jar
COPY ./ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
