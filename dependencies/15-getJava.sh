#!/bin/bash -e

echo "Getting Java 8..."

DIR=/usr/local/java
sudo mkdir -p $DIR
cd $DIR
 sudo wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz

 echo "Configuring Java..."
 sudo tar -zxf jdk-8u151-linux-x64.tar.gz
 
JDIR=jdk1.8.0_151
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
 
 
