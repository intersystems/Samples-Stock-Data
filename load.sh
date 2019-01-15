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
#
# load Stock Trading Data into iris container
echo "Installing Stock Trading data..."
# get directory that we are running in to use as base directory
basedir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
targetdir="/tmp/irisupdate"
containername="try-iris"
echo "copy from "$basedir"/. to "$containername":"$targetdir"/"


# update environment file to add JAVA_HOME and CLASSPATH
echo "Creating iris session to load data"
# get passwd without echoing to terminal
echo -n "Enter updated _SYSTEM PASSWORD: "; stty -echo; read passwd; stty echo; echo

echo "about to execute load-data.sh"
# cat ~/Samples-Stock-Data/load_data.script
# copy files into try-iris container in /tmp/irissys directory
sudo docker exec $containername mkdir -p $targetdir
sudo docker cp $basedir/data/. $containername:$targetdir/
sudo docker exec --env passwd=$passwd $containername $targetdir/load_data.sh
