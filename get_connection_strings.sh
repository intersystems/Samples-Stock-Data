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

# get your external IP address
export myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
# print out the local connection string and management portal address
echo "The InterSystems IRIS JDBC connection string is in the format jdbc:IRIS//<external IP address>:51773/<DB Namespace>"
echo "Your current JDBC connection string is: jdbc:IRIS//$myip:51773/USER"
echo "Your System Management Portal is available at http://$myip:52773/csp/sys/utilhome.csp"