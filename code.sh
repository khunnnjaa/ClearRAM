# Written by khunnnjaa
# August 04, 2016
# Feel free to contact me at: khunnnjaa@example.com
#
# References:
# http://unix.stackexchange.com/questions/269078/executing-a-bash-script-function-with-sudo
# http://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/
# http://askubuntu.com/questions/155768/how-do-i-clean-or-disable-the-memory-cache


# To check current memory usage, run this:
#	$	watch -n 1 free -m
#			or
#	$	watch -n 1 cat /proc/meminfo
clear_RAM() {
	if [[ $EUID -ne 0 ]]; then
		echo "You must be a root user"
		echo "$ sudo bash $0"
		exit 1
	else
# [soon]	#total="$(free -h | sed -n -e '2p' | awk '{print $2}')"
# [soon]	#free="$(free -h | sed -n -e '2p' | grep -Po '\S+$')"
# [soon]	#total_ram_before="$(free -m | grep 'Mem:' | awk '{print $2}')"
# [soon]	#free_ram_before="$(free -m | grep 'Mem:' | awk '{print $7}')"
# [soon]	#echo "	Before:"
# [soon]	#echo "		Total RAM: ${total_ram_before}"
# [soon]	#echo "		Currently available RAM: ${free_ram_before}"
	echo " "
	# clearing..
	echo " "
	su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'" root
# [soon]	#total_ram_after="$(free -m | grep 'Mem:' | awk '{print $2}')"
# [soon]	#free_ram_after="$(free -m | grep 'Mem:' | awk '{print $7}')"
# [soon]	#echo "	After:"
# [soon]	#echo "		Total RAM: ${total_ram_after}"
# [soon]	#echo "		Currently available RAM: ${free_ram_after}"
	fi	
}
FREE_RAM=$(declare -f clear_RAM)
alias freeram='sudo bash -c "$FREE_RAM; clear_RAM"'
