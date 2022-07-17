In order to run the application properly, system should have single instance of MySql (in our case , XAMPP already has MySql lite so we don't need workbench)
Our project is hosted on a local server so XAMPP needs to be installed and after installation place the source code of the project in `bin/htdocs/` directory
inside the installation directory of the XAMPP.
After this , start the Apache Web Server and MySql server from XAMPP control panel. Once they are live, 
go to http://localhost/phpmyadmin/index.php?route=/server/databases&lang=en
here create a new database with exact name `bidding_db` and import the `bidding_db.sql`
present in the `DBS_PR_04_2019B2A70691P/DBS_PR_04_Code_2019B2A70691P/database/`
then press `GO`.
Now,
go to `http://localhost/DBS_PR_04_2019B2A70691P/DBS_PR_04_Code_2019B2A70691P/` to work in the user mode of the application.
To work in the ADMIN mode of the application, go to 
`http://localhost/DBS_PR_04_2019B2A70691P/DBS_PR_04_Code_2019B2A70691P/admin/`.
From here you can use the admin functionality of the application(explained in the documentation).
Finally to close the application, simple stop the Apache web server and MySql server in the XAMPP control panel and close the web browser.



ADMIN USERNAME : `admin`
ADMIN PASSWORD : `admin123`

Sample staff username : `arnia`
Sample staff password : `arnav`
