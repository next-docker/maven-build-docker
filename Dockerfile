FROM ping2ravi/jdk:oracle_jdk8.92.14_ubuntu.14.04

MAINTAINER Ravi Sharma

#Install Maven

ENV MAVEN_VERSION 3.3.9

RUN  wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz; mkdir /opt/maven; mv apache-maven-${MAVEN_VERSION}-bin.tar.gz /opt/maven/.; cd /opt/maven/; gunzip apache-maven-${MAVEN_VERSION}-bin.tar.gz ; tar -xvf apache-maven-${MAVEN_VERSION}-bin.tar; 

ENV MAVEN_HOME /opt/maven/apache-maven-${MAVEN_VERSION}

ENV PATH ${PATH}:${MAVEN_HOME}/bin

#Install GIT

RUN sudo apt-get install -y  git

ADD ./runMavenBuild.sh /
RUN chmod 755 /runMavenBuild.sh

RUN echo $GIT_REPO
ENTRYPOINT ["sh", "/runMavenBuild.sh"]
