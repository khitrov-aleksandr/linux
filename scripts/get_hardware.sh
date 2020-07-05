#!/bin/sh

get_server_model() {
	sudo dmidecode |grep Product\ Name|uniq|sed 2d|sed -e s/Product\ Name:\ //|xargs
}

get_cpu_model() {
	cat /proc/cpuinfo|grep model\ name|uniq|awk -F ': ' '{print$2}'
}

get_sockets_num() {
	cat /proc/cpuinfo|grep physical\ id|sort|uniq|wc -l|xargs
}

get_cpu_physical_cores() {
	ONE_CPU_CORES=$(grep ^cpu\ cores /proc/cpuinfo | uniq |  awk '{print $4}')
	SOCKETS_NUM=$(get_sockets_num)
	#echo $(($(get_sockets_num) * $ONE_CPU_CORES))
	expr $ONE_CPU_CORES \* $SOCKETS_NUM
}

get_cpu_threads() {
	cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l
}

get_ram() {
	free -m|grep Mem|awk '{print$2}'
}

get_oracle_db_name() {
	ps aux|grep oracle|grep LOCAL|awk '{print$11}'|uniq|sed -e s/oracle//
}

echo "Server model:	$(get_server_model)"
echo "CPU model:	$(get_cpu_model)"
echo "Sockets:	$(get_sockets_num)"
echo "Cores:		$(get_cpu_physical_cores)"
echo "Threads:	$(get_cpu_threads)"
echo "RAM: 		$(get_ram)"
echo "DB Name: 	$(get_oracle_db_name)"

exit 0
