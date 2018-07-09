FROM jenkins/jenkins:2.131-alpine

COPY plugins.txt /usr/share/jenkins/plugins.txt

RUN cat /usr/share/jenkins/plugins.txt | xargs /usr/local/bin/install-plugins.sh
