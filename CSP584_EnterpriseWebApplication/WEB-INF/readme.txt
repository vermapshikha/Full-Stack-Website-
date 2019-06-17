To compile
	Double click on compile.bat insed WEB-INF folder

To Run
	1) Import DB using Import data option under server menu, select the import from self contained file and browse for 			ProjectDB.sql file
	
	2) Run following command from mongodb bin folder 
	mongorestore -d restaurantmenu project_mongo_backup	

	3)Type http://localhost/FoodTreats/index.jsp in browser and hit enter 