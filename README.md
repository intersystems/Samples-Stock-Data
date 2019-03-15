# Samples-Stock-Data
This repository contains sample stock data and the scripts to load it into your InterSystems IRIS instance.

## GET CONNECTED: Reset your password and get connection information
This sample assumes you already have an instance. If you do not yet have one, you can visit: [Direct Access to InterSystems IRIS](https://learning.intersystems.com/course/view.php?name=Java%20Build), [Microsoft Azure](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/intersystems.intersystems-iris-single-node), [Google Cloud Platform](https://console.cloud.google.com/marketplace/details/intersystems-launcher/intersystems-iris), or [Amazon Web Services](https://aws.amazon.com/marketplace/pp/B07KVYZYT9).

1) Reset the default passwords

	`iris password`
		This will ask you for your new password, and will reset the password for all default user accounts

2) Check the status of your iris instance

	`iris status`
		This will show the current status of the InterSystems IRIS instance
		
3) Get your connection information

	`iris info`
		This will show the external ip address and ports needed to make connections to InterSystems IRIS

## LOADING DATA: Using GCP, Azure, or AWS

1) Get the sample data and scripts
	
	`iris load https://github.com/intersystems/Samples-Stock-Data`

## LOADING DATA: Using a local instance

1) Clone this repository: `git clone https://github.com/intersystems/Samples-Stock-Data`
2) Navigate to System Explorer > Classes and import into the USER namespace from the data folder: DemoStockCls.xml, StocksUtil.xml, and TradeAndPersonForHibernate.xml
3) On the Management Portal home, under Links select Terminal. Run (replace <repo home> with your home directory): 
	`do ##class(Demo.Stock).LoadData("<repo home>/data/all_stocks_1yr.csv")`


---
## TAKE A LOOK AT THE DATA - from the IRIS shell (database user)
 
1) Start a SQL Session  

	```
	sudo docker exec -it try-iris iris session iris
	Username: SuperUser
	Password: <new password>
	USER>> do $system.SQL.Shell()
	[SQL]USER>> set selectmode=display
	[SQL]USER>> select top 10 * from demo.stock where transdate = '8/12/2016' order by stockclose desc
	```

2) Try other SQL commands
3) Type `q` to exit the SQL Session
4) Type `h` to exit the iris session
