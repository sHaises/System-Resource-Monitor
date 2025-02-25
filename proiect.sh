#!/bin/bash
#System Resource Monitor
case "$1" in
1)

while :
do

clear
antet="                          Proces_Name                                     %Cpu"
echo $antet | awk '{printf "%-12s %20s\n", $1,$2}'

# Store the output of the ps command in a variable
ps_output=$(ps -eo pcpu,pid,user,args | grep -v PID | sort -k 1 -r | head -n 10)

# Use awk to print the process name and CPU usage in a formatted way
echo "$ps_output" | awk '{printf("%s %.2f%%\n", $4, $1)}'


sleep 3
done
	;;
2)
function disk_statistics {



echo  "Transferuri   kB_read_pe_s  kB_wrtn_pe_s kB_read kB_wrtn"



# Get list of disk devices from lsblk
disks=$(lsblk -d -o NAME)

# Loop through each disk and print its statistics from /proc/diskstats
for disk in $disks; do
 
    stats=$(cat /proc/diskstats | grep "$disk ")
    echo "$stats" | awk '{printf "%-12s %8s %12s %12s %12s %12s\n", $3, $4, $8, $12, $6, $10}'
done

}


function iostat_like {
while true
do
disk_statistics
sleep 5
done
}


iostat_like
	;;
3)function show_traffic_stats() {

    local interface=$1
    local rx_bytes=$(cat /sys/class/net/$interface/statistics/rx_bytes)
    local tx_bytes=$(cat /sys/class/net/$interface/statistics/tx_bytes)
    echo $interface
    echo "Received: $rx_bytes bytes"
    echo "Transmitted: $tx_bytes bytes"
}
while true 
do
while IFS= read -r line; do
show_traffic_stats $line
done < <( ip link |grep -oP "\b\d+: [a-z0-9]+" | awk -F ': |:' '{print $2}' ) 


sleep 3
done 
;;
4)
while :
do

clear
antet="                          Proces_Name                                     %Memory"
echo $antet | awk '{printf "%-12s %20s\n", $1,$2}'


# Collect the data
ps_output=$(ps -eo pmem,pid,user,args | grep -v PID | sort -k 1 -r | head -n 10)

# Use awk to print the process name and memory usage in a formatted way
echo "$ps_output" | awk '{printf("%s %.2f%%\n", $4, $1)}'

sleep 3
done
	;;
	*)
	echo Pentru a folosit scriptul tasteaza 1 pentru CPU  usage 2 pentru I/O si 3 pentru bandwith si 4 pentru memory ussage
	exit 1
esac
