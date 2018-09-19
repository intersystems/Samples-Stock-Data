# Samples-Stock-Data
This repository contains sample stock data and the scripts to load it into your InterSystems IRIS instance.

Load the data in your instance and then use the sample code in https://github.com/intersystems/stock-trading-with-java-isc1128
(You will also need to download the InterSystems IRIS JDBC driver from maven central)

These steps are written for instances running in the Google Cloud Platform

1) check out the IRIS CLI - which gives you access to all classes and data
	iris session   
		    initial credentials: username: _SYSTEM  password: SYS
	    
	set a="persistence rules!"
	write a
	
	 halt



		a. My scripts assume that everything happens relative to the users home directory
	10. git clone http://github.com/intersystems/Samples-Stock-Data
		a. Enter github username and password (will go away when public)
	11. ./Samples-Stock-Data/load_java_data.sh
		a. Enter github username and password (will go away when public)
		b. Enter the new password set in 8c above
	12. ./Samples-Stock-Data/get_connection_strings.sh
		a. This shows JDBC connection string and management portal URL
	13. iris session
		a. username: sqluser
		b. password: sqluser
		c. Enter new password twice and don't foget it
	14. COS zn "USER"
		a. the stock data is loaded into the USER namespace as that is how Java Play uses it
	15. set selectmode=display
		a. Helps with date display in next step
	16. select top 10 * from demo.stock where transdate = '8/12/2016' order by stockclose desc
		a. You can do more if you want
		b. q
		c. This same code could be entered in the SQL editor in the Management Portal
