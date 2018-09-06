# java-app
#hosting java web application
This package provides support to build Test environment for limited release of a Java Application with https support. 
Package consists of following components:

1) build_env.sh - This script is subjected for ubuntu only. It checks the pre-requisites like whether Docker and docker-compose are installed for building test environment. If above mention tools are not installed, then it installs them. After checking prerequisite, it launches java application using docker-compose yml file.

2) docker-compose.yml - This file includes all configuration, like how many containers to be build and from which image. It also includes information of port, volumes, network, etc. of docker containers. 
In current application, we have launched 2 containers, 1 for nginx(proxy) and 1 for tomcat(webapp). Here webapp container is linked with proxy container so that they can communicate with each other.
As prevayler library is used by Application developers for data persistency, so we have mapped the prevayler filesystem inside container with docker volume on Host, so that it can be shared across multiple containers.

3) nginx - In order to serve static content of Java application, nginx is used . It also acts as Load Balancer for web server.
  3.1) Dockerfile - This is Docker file from which nginx image(proxy image) is build. This file copies static assets, self signed certificates and nginx configuration file from host to container.
  3.2) default.conf - This is the configuration file that nginx will use for forwarding request for any dynamic content to upstream webserver and for any static content to itself. Here ssl is also enabled to support https for application.
  3.3) ssl - This folder consists of self signed certificates for supporting https. These certificates and keys are copied to nginx container.
  3.4) static.zip - This is the zip file for static assets of the application. Only static assets need to be present in nginx container so that whenever changes are made to dynamic part of application, whole application is not impacted.

4) tomcat - In order to serve dynamic war file of Java application, tomcat is used. 
  4.1) Dockerfile -  This is Docker file from which  tomcat image(webapp image) is build. This file copies war file from host to container and tells tomcat from where to access the war file.
  4.2) companyNews.war - This is Java application war file. This file is copied to tomcat container in order to segregate static assets with dynamic content.

=======================================================

Steps for usage:

1. Clone the git repository on your system preferably ubuntu.

apt-get install git
git clone https://github.com/ashikansal/java-app.git
cd java-app
chmod +x build_env.sh

2. If host system is Ubuntu, run "build_env.sh" to build environment.
./build_env.sh

If host system is any other, first install:
docker
docker-compose

After this run below command directly after going to cloned directory:

sudo docker-compose -f docker-compose.yml -p hello up -d

3) Check if container are running using:

sudo docker ps  | grep hello_proxy
sudo docker ps  | grep hello_webapp



After this application will be reachable at :

https://<host-ip>

=======================================================
In order to test application :

Go to web browser, open url "https://<host-ip>"

>> welcome page will open.
Now post some comtent by clicking on link, submit the content.

After this page is redirected to read link:
Here use HTTPS instead of HTTP to post and read the content on application


