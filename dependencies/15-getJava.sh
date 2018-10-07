#!/bin/bash -e

echo "Getting Java 8..."

DIR=/usr/local/java
sudo mkdir -p $DIR
cd $DIR
 sudo wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz

 echo "Configuring Java..."
 sudo tar -zxf jdk-8u181-linux-x64.tar.gz

JDIR=jdk1.8.0_181
cd $JDIR
 sudo update-alternatives --install /usr/bin/java java $DIR/$JDIR/bin/java 100
 sudo update-alternatives --config java
 sudo update-alternatives --install /usr/bin/javac javac $DIR/$JDIR/bin/javac 100
 sudo update-alternatives --config javac
 sudo update-alternatives --install /usr/bin/jar jar $DIR/$JDIR/bin/jar 100
 sudo update-alternatives --config jar
 touch ~/.bash_profile
 echo "export JAVA_HOME=$DIR/$JDIR" >> ~/.bash_profile
 echo "export JRE_HOME=$DIR/$JDIR/jre" >> ~/.bash_profile
 echo "export PATH=$PATH:$DIR/$JDIR/bin:$DIR/$JDIR/jre/bin" >> ~/.bash_profile
