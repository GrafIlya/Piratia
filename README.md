# Corsairs-Online-Public

### How to install:

1. Install vs2003 (https://drive.google.com/file/d/19PsTGwXYTUiCSq8ilw7DBAyy8pfIhKfU/view) and vs2013 update 5 (https://visualstudio.microsoft.com/vs/older-downloads/).
2. Install and configure MSQL of any version liked - recommended MSQL 2019 and the guide as follows: https://pko.coffeecup.com/. Don't do anything regarding db accounts (except sa), dbs, ip or more yet - leave that part for later.
3. Install git for windows. Select the cmd.exe options (but no options with added unix tools please).
4. Download the project:
    1. **WARNING: .bat files must have Windows' CR LF line endings - The following will break the build:**
		1. Downloading project files from the web page repository (files will come with Linux line endings).
		2. Using git on a different operating system other than Windows first (files will come with line endings of respective OS - Mac with CR, Linux with LF).
    2. Run cmd.exe with Admin priviledges (Search for "Command Prompt" and click "Run as administrator").
    3. Then cd to the folder where you want the project to be - like the following, for example (if it doesn't exist, also do mkdir C:/dev) - remember the /D parameter here:
    ```
	cd /D C:/dev
	```
    4. Then type the following to download the files and then close the command prompt:
    ```
	git clone "https://gitlab.com/deguix/corsairs-online-public"
	```
5. Create dbs:
    1. Run the "build_db.bat" inside the sql_scripts folder.
    2. Type the sa password so it will create the dbs properly.
6. Compile the project:
    1. Go to the source folder, then click both Client.sln and Server.sln (which will run both vs2003 and vs2013). For the next instructions do everything for both of them.
    2. There's a dropdown box right next to the "Start" button, which initially will say "Debug". Click that box and change it to "Release".
    3. Press Ctrl+Shift+B to build all projects in the solution (alternative is the "Build" menu and "Build solution").

### How to update project files:
1. Run a git pull:
    1. Run cmd.exe (Search for "Command Prompt" and click it).
	2. Then cd to the project folder - remember the /D parameter here - example:
	```
	cd /D C:/dev/corsairs-online-public
	```
	3. Then type the following:
	```
	git pull
	```

### How to use:
1. Start the SQL server (if it isn't by now) and run runall.bat in server folder to start all game server exe's.
2. Run local.bat or StartGame.bat in client folder to run client.
3. Put the user name *deguix* and pass *123456* and press Enter (it's a fresh account, no chars are there). The game should be working at this point.
