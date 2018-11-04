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

# load Stock Trading Data into iris container
echo "Installing Stock Trading with Java data..."
cd ~/
git clone http://github.com/intersystems/ls-iris-java-exp

# copy files into iris container in /tmp/irissys directory
echo "Copying ls-iris-java files into /tmp/irissys directory..."
docker exec iris mkdir -p /tmp/irisupdate
docker cp ~/ls-iris-java-exp/all_stocks_1yr.csv iris:/tmp/irisupdate/all_stocks_1yr.csv
docker cp ~/ls-iris-java-exp/DemoStockCls.xml iris:/tmp/irisupdate/DemoStockCls.xml
docker cp ~/ls-iris-java-exp/StocksUtil.xml iris:/tmp/irisupdate/StocksUtil.xml 
docker cp ~/ls-iris-java-exp/StocksUtil.xml iris:/tmp/irisupdate/TradeAndPersonForHibernate.xml

# update environment file to add JAVA_HOME and CLASSPATH
echo "Creating iris session to load data"
# get passwd without echoing to terminal
echo -n "Enter updated _SYSTEM PASSWORD: "; stty -echo; read passwd; stty echo; echo

sed -i -r "s|PASSWORD|$passwd|" ~/Samples-Stock-Data/load_data.script
echo "about to execute load-data.sh"
# cat ~/Samples-Stock-Data/load_data.script

docker exec iris mkdir -p /tmp/irisupdate
docker cp ~/Samples-Stock-Data/load_data.script iris:/tmp/irisupdate/load_data.script
docker cp ~/Samples-Stock-Data/load_data.sh iris:/tmp/irisupdate/load_data.sh
docker exec iris /tmp/irisupdate/load_data.sh
