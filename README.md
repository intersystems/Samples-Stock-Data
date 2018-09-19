# Samples-Stock-Data
This repo contains the code to import sample stock data into your InterSystems IRIS instance

Draft of steps to execute

	1. Go to Marketplace
	2. Launch IRIS Instance
	3. Click ssh button
	4. Type iris info
	5. Log out
	6. Ssh again
	7. iris info
		a. Make sure it is status: "running"
	8. iris session
		a. username: _SYSTEM
		b. password: SYS
		c. Then change password and write it down for later
		d. Do something in session?
		e. halt
	9. cd ~/
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