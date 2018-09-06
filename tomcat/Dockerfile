FROM tomcat:latest

MAINTAINER Ashi Kansal

#ENV REFRESHED_AT 2015-09-20
#ENV GITHUB_REPO https://github.com/garystafford/spring-music/raw/build-artifacts
#ENV APP_FILE spring-music.war

#RUN apt-get update -y && \
#  apt-get install wget -y && \
#  wget -O /usr/local/tomcat/webapps/ROOT.war ${GITHUB_REPO}/${APP_FILE} && \
#  mv /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/_ROOT

RUN apt-get update -y
COPY companyNews.war /usr/local/tomcat/webapps/ROOT.war
RUN mv /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/ROOT_backup
