# VARIABLE INITIALIZATION

read -r -d '' options << 'EOF' # Okay, so apparently, it READS an input. 
***** Choose an option: *****
1. Show current directory ONLY
2. Show current user ONLY
3. List files
4. List files with details
5. Show current date
6. Exit
EOF
# But the input is from the HEREDOC. -r is kinda useless here, but -d basically makes it end until EOF 
# The thing to be read also starts AFTER the EOF part, which is called the opening delimiter. I put something besides it accidentally and it broke my script


# FUNCTION INITIALIZATION
function showDashb { # Simply tried using the function key-word here. The read/heredoc area is also here so that the values are updated each time the method is called.
read -r -d '' dashb << EOF #Adding single quotes around EOF makes everything literally printed. I had to remove it for correct interpretaion.
===============================
    SYSTEM STATUS DASHBOARD
===============================

User: $USER
Home: $HOME
Current Directory: $PWD
Host Name: $HOSTNAME
EOF
	echo -e "$dashb"
}
# I apparently can't put comments beyond delimiter.
# This $USER is the system-defined variable for the current User. I could have also used whoami, but I dont think that is a variable.
# $HOME is System-defined variable for the User's home directory.
#$PWD - I noticed that I couldnt really use the command (pwd), so I really had to use the variable.
# Host name yippiee

showMenu() { #Standard function declaration type.
	echo -e "$options"
}

while true 
do
showDashb
showMenu
read -p "Enter choice: " choice 

case "$choice" in
	1) 
		clear
		echo "Current Directory: $PWD"
	;;
	2)
		clear
		echo "User: $USER"
	;;
	3)
		clear
		ls
	;;
	4)
		clear
		ls -Xhli
	;;
	5)
		clear
		echo "Date today: " $(date)
	;;
	6)
		echo "Exiting Dashboard..."
		break
	;;
	*)
		echo "Invalid Input. Please choose between 1-6."
	;;
esac # I realized here that changing from an elif ladder to a case makes it shorter, simpler, and value type lenient.
done



