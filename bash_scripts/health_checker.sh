showMenu() { # I love that I remember everysingle part to do here, just besides the system features. Now I know df is disk free and free is... free.
read -r -d '' menu_string << EOF
=======================
    HEALTH CHECKER
=======================\n
Date Today: $(date)
Current Directory: $(pwd)
Options:
1. Show RAM Status
2. Show Free Memory
3. Show Uptime
4. Show CPU and Process Monitoring
5. Exit Program
EOF
	echo -e "$menu_string"
}

while true 
do
showMenu

read -p "Enter Choice: " choice
# Nothing to say about the system keywords, since they are very alien to me
case "$choice" in
	1)
		clear
		echo "Disk Space Usage: $(df -h | grep '/$')"
	;;
	2)
		clear
		echo -e "Free Memory Status: \n$(free -h)"
	;;
	3)
		clear
		echo "Uptime Metrics: $(uptime | awk -F'load average:' '{print $2}')"
	;;
	4)
		clear
		echo "CPU: $(ps aux | grep target_process_name | awk '{print $3"%"}')" # OKay, now I'll remember about the regex thingy and square bracket rule
		echo "CPU Usage for Bash Shells: $(ps aux | grep '[b]ash' | awk '{print $3"%"}')" 
		# Using [b]ash as a reliable test process so it safely resolves with real CPU percentages!
	;;
	5)
		clear
		echo "Exiting Health Checker..."
		break
	;;
	*)
		clear
		echo "Invalid input. Please try again."
	;;
esac
done
