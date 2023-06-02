# AD-Connect-and-Add-Mobile-User
Uses Directory services via applescript to create a new user from the AD in mobile user mode. 

When you run the script, it will prompt you for Active Directory credentials. After providing the credentials, it will open Directory Utility, connect to Active Directory, and display the Directory Editor. You can then click the "+" button to add a new user as a mobile user.

The script will prompt you for the new user's username, password, full name, and home directory path. Once you provide these details, the script will create a new user record and add it as a mobile user. Finally, it will close Directory Utility and display a dialog indicating that the new user has been added successfully.

Please note that this script assumes you have the necessary permissions and access to connect to Active Directory and add users as mobile users. Additionally, the script uses the built-in macOS application, Directory Utility, to perform these operations.
