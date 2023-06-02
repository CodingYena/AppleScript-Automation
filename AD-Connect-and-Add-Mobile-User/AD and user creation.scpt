-- Prompt for Active Directory credentials
display dialog "Enter Active Directory credentials:" with title "Active Directory Authentication" default answer "" buttons {"Cancel", "OK"} default button 2 with hidden answer
set adUsername to text returned of the result
set adPassword to text returned of the result

-- Connect to Active Directory
try
    tell application "Directory Utility"
        open
        activate
    end tell
    
    tell application "System Events"
        tell process "Directory Utility"
            -- Connect to Active Directory
            set frontmost to true
            click button "Directory Editor" of window 1
            delay 1
            click pop up button 1 of window 1
            click menu item "Active Directory" of menu 1 of pop up button 1 of window 1
            click button "Continue" of window 1
            delay 1
            click radio button "Custom Path" of group 1 of window 1
            click button "Edit…" of group 1 of window 1
            delay 1
            keystroke adUsername
            keystroke tab
            keystroke adPassword
            keystroke return
            delay 1
            
            -- Add new user as a mobile user
            click button "Show Records" of group 1 of window 1
            delay 1
            click button "+" of group 1 of window 1
            delay 1
            set newUserName to text returned of (display dialog "Enter new username:" with title "Add New User" default answer "" buttons {"Cancel", "OK"} default button 2)
            set newUserPassword to text returned of (display dialog "Enter new user password:" with title "Add New User" default answer "" buttons {"Cancel", "OK"} default button 2 with hidden answer)
            set newUserFullName to text returned of (display dialog "Enter new user full name:" with title "Add New User" default answer "" buttons {"Cancel", "OK"} default button 2)
            set newUserHomeDirectory to text returned of (display dialog "Enter new user home directory path:" with title "Add New User" default answer "" buttons {"Cancel", "OK"} default button 2)
            
            set newUserRecord to make new record with properties {recordtype:"dsRecTypeStandard:Users", short name:newUserName, password:newUserPassword, full name:newUserFullName, home directory:newUserHomeDirectory}
            click button "Create" of group 1 of window 1
            delay 1
            
            -- Close Directory Utility
            click button "Quit" of window 1
        end tell
    end tell
    
    display dialog "New user has been added successfully." buttons {"OK"} default button 1
on error errorMessage
    display dialog "An error occurred: " & errorMessage buttons {"OK"} default button 1
end try
