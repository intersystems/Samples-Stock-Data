# Samples-Stock-Data
This repository contains sample stock data and the scripts to load it into your InterSystems IRIS instance.


LOADING DATA: These steps are written for instances running in the Google Cloud Platform

1) check out the IRIS CLI - which gives you access to all classes and data
	iris session   
		    (initial credentials: username: _SYSTEM  password: SYS)
	    
	set a="persistence rules!"
	write a
	
	halt



	
2) Get the sample data and scripts
	
	git clone http://github.com/intersystems/Samples-Stock-Data
		
		
	 ./Samples-Stock-Data/load_java_data.sh
	
	
3) Set up access from your IDE - JDBC connection and database account
	
	 ./Samples-Stock-Data/get_connection_strings.sh
		(Gives you the JDBC connection string)
	
	iris session   
		    (initial credentials: username: sqluser  password: sqluser)
               



GET GOING IN JAVA - in your IDE

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
 
 
 Take a look at the data - from the IRIS shell (database user)
 

        COS zn "USER"
		
	set selectmode=display
		
	select top 10 * from demo.stock where transdate = '8/12/2016' order by stockclose desc
		
