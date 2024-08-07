FROM docker.io/library/ubuntu:18.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN apt-get clean
RUN mkdir /usr/local/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz  /tmp/apache-tomcat-9.0.93.tar.gz
RUN cd /tmp &&  tar xvfz apache-tomcat-9.0.93.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.93/* /usr/local/tomcat/
ADD ./target/*.war /usr/local/tomcat/webapps/ABCtechnologies.war
ADD ./tomcat-users.xml /usr/local/tomcat/conf/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
