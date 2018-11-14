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

## LOADING DATA: These steps are written for instances running in Google Cloud Platform or Azure

1) Get the sample data and scripts
	
	`git clone http://github.com/intersystems/Samples-Stock-Data`
	
	`./Samples-Stock-Data/load.sh`

OR --- if the new code works

	`iris load https://github.com/intersystems/Samples-Stock-Data`
	
---
## TAKE A LOOK AT THE DATA - from the IRIS shell (database user)
 
1) Start a SQL Session  

	`sudo docker exec -it try-iris iris session iris`  
	(username: sqluser to get a SQL Shell)  
	`[SQL]DB>> COS zn "USER"`  
	`[SQL]USER>> set selectmode=display`  
	`[SQL]USER>> select top 10 * from demo.stock where transdate = '8/12/2016' order by stockclose desc`  
		
2) Try other SQL commands
