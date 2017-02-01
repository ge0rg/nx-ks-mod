renice -n -15 -p $$ &> /dev/null &
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cleanup(){
	killall -q telnetd
	killall -q busybox
	killall -q onscreen_rc
	$DIR/off_nx-rc.sh
	rm -f $DIR/auto/nx-rc.sh
	 nice -n +10 $DIR/popup_timeout "No WiFi - Telnet/FTP closing" 3
	pkill -f EV_MOBILE.sh

}
showip(){
	IP=`ip addr ls|grep inet|grep mlan0|cut -d/ -f 1|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'`
	[[ ! -z $IP ]] && nice -n +10 $DIR/popup_timeout "Telnet/FTP: $IP" 10 &
}
alreadyrunning(){
	 nice -n +10 $DIR/popup_timeout "Already Running" 2
	showip
	exit;
}
netcheck(){
	while [[ ! -z $IP ]]; do
		IP=`ip addr ls|grep inet|grep mlan0|cut -d/ -f 1|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'`
		sleep 2
	done
	cleanup
}
initserv(){
	$DIR/telnetd &
	$($DIR/busybox tcpsvd -u root -vE 0.0.0.0 21 $DIR/busybox ftpd -w -v /opt/storage/sdcard)&
	showip	
	netcheck &
}
#
[[  $(ps -ef | grep -v grep | grep MOBILE.sh | wc -l) -gt 2 ]] && alreadyrunning || initserv
#
