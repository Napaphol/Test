#!/bin/bash
### BEGIN INIT INFO
# Provides:          hcvmcomp
# Required-Start:    $local_fs $remote_fs $network $syslog $named
# Required-Stop:     $local_fs $remote_fs $network $syslog $named
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: HC vm component
# Description:       Start the HC vm component
#  This script will start the HC vm component.
### END INIT INFO
export PATH=$PATH:/sbin:/usr/bin:/bin:/usr/local/bin
ulimit -c 0
. /lib/lsb/init-functions > /dev/null 2>&1

case "$1" in
  start)
		/usr/bin/hcvmcomp stop
	     if [ -f /tmp/hcvmcomp.pid ]; then
         	rm /tmp/hcvmcomp.pid
 	     fi
	    /usr/bin/hcvmcomp start
		echo "hcvmcomp started"
        ;;
  stop)
	    /usr/bin/hcvmcomp stop

    if [ -f /tmp/hcvmcomp.pid ]; then
 	rm /hcvmcomp.pid
    fi
	
 echo "hcvmcomp stopped"
        ;;

  *)
	echo "Usage: hcvmcomp { start | stop }"
esac

exit 1

