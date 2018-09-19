#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# update packages and install openjdk8
echo "Installing Java and loading sample data..."
sudo apt-get update
sudo apt-get install openjdk-8-jdk

# copy InterSystems JDBC driver from iris container
echo "Pulling InterSystems JDBC driver..."
sudo mkdir -p /usr/lib/irissys/JDK18
sudo docker cp iris:/usr/irissys/dev/java/lib/JDK18/intersystems-jdbc-3.0.0.jar /usr/lib/irissys/JDK18

# update environment file to add JAVA_HOME and CLASSPATH
echo "Updating environment files"
sudo cp /etc/environment ~/env.txt
sudo chown $USER:$USER ~/env.txt
echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> ~/env.txt
echo 'export JAVA_HOME' >> env.txt
echo 'CLASSPATH="/usr/lib/irissys/JDK18/intersystems-jdbc-3.0.0.jar"' >> ~/env.txt
echo 'export CLASSPATH' >> ~/env.txt
sudo cp ~/env.txt /etc/environment
# rm ~/env.txt
source /etc/environment

# load stock trading with Java sample code from git
git clone http://github.com/intersystems/stock-trading-with-java-isc1128
