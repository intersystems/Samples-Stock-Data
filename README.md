# Samples-Stock-Data
This repository contains sample stock data and the scripts to load it into your InterSystems IRIS instance.

## GET CONNECTED: Reset your password and get connection information

1) Reset the default passwords

	`iris password`
		This will ask you for your new password, and will reset the password for all default user accounts

2) Check the status of your iris instance

	`iris status`
		This will show the current status of the InterSystems IRIS instance
		
3) Get your connection information

	`iris info`
		This will show the external ip address and ports needed to make connections to InterSystems IRIS

## LOADING DATA: These steps are written for instances running in the Google Cloud Platform

1) Get the sample data and scripts
	
	git clone http://github.com/intersystems/Samples-Stock-Data
		
	
	`./Samples-Stock-Data/load.sh`
	
OR --- if the new code works

	`iris load https://github.com/intersystems/Samples-Stock-Data`
	
              
---
## GET GOING IN JAVA - in your IDE

Use the sample code from Github: https://github.com/intersystems/stock-trading-with-java-isc1128
(You will also need to download the InterSystems IRIS JDBC driver from maven central)

1) Get connected from your IDE

     Start a new Java Project 
     
     add the file: jdbcplaystocksTask1.java
     
     plug in your JDBC string and credentials in lines 9-11
     
     run your code
     
 2) Try playing the stock market
 
     add the file: jdbcplaystocksTask5.java
     
     plug in your JDBC string and credentials in lines 17-19
     
     run your code
     
          build a portfolio and make some money...
     
 3) Try our Native API - with this you'll be able to create your own fast data structures, and access many built-in functions
 
     add the file: nativeplaystocksTask5.java
     
     add the directory
     
     plug in your JDBC string and credentials in lines 21-23
     
     run your code
          build a portfolio and make some money...
 
---
## TAKE A LOOK AT THE DATA - from the IRIS shell (database user)
 
1) Start a SQL Session  

	`iris session`  
	(username: sqluser to get a SQL Shell)  
	`[SQL]DB>> COS zn "USER"`  
	`[SQL]USER>> set selectmode=display`  
	 `[SQL]USER>> select top 10 * from demo.stock where transdate = '8/12/2016' order by stockclose desc`  
		
2) Try other SQL commands
