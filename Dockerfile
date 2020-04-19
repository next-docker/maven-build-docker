FROM ping2ravi/jdk:openjdk_15_alpine_3.11

MAINTAINER Ravi Sharma

#Install Maven

ENV MAVEN_VERSION 3.6.3

RUN  wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz; mkdir /opt/maven; mv apache-maven-${MAVEN_VERSION}-bin.tar.gz /opt/maven/.; cd /opt/maven/; gunzip apache-maven-${MAVEN_VERSION}-bin.tar.gz ; tar -xvf apache-maven-${MAVEN_VERSION}-bin.tar; 

ENV MAVEN_HOME /opt/maven/apache-maven-${MAVEN_VERSION}

ENV PATH ${PATH}:${MAVEN_HOME}/bin

#Install GIT

RUN apk --update add git

RUN mkdir -p /opt/health;mkdir -p /opt/ci
ADD healthcheck.sh /opt/health/healthcheck.sh
ADD settings.xml /opt/ci/settings.xml
RUN chmod 755 /opt/health/healthcheck.sh
ENV MVN_SETTINGS_XML "/opt/ci/settings.xml"
ENV HEALTH_CHECK_SCRIPT "/opt/health/healthcheck.sh"


ADD ./runMavenBuild.sh /
RUN chmod 755 /runMavenBuild.sh

RUN echo $GIT_REPO
ENTRYPOINT ["sh", "/runMavenBuild.sh"]
