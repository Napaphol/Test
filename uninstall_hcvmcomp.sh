#!/bin/bash
echo "Removing HC VM Component, please wait ..."
if [ -f /usr/sbin/update-rc.d ]; then
	/usr/sbin/update-rc.d hcvmcomp remove >> .log_remove 2>&1
else
	if [ -f /etc/rc3.d/S99hcvmcomp ]; then 	     
		/bin/rm /etc/rc3.d/S99hcvmcomp
	fi
	if [ -f /etc/rc5.d/S99hcvmcomp ]; then	
		/bin/rm /etc/rc5.d/S99hcvmcomp
	fi
	if [ -f /etc/rc2.d/S99hcvmcomp ]; then
		/bin/rm /etc/rc2.d/S99hcvmcomp
	fi
	if [ -f /etc/rc0.d/K99hcvmcomp ]; then
		/bin/rm /etc/rc0.d/K99hcvmcomp
	fi
	if [ -f /etc/rc6.d/K99hcvmcomp ]; then	
		/bin/rm /etc/rc6.d/K99hcvmcomp
	fi
fi
if [ -f /etc/init.d/hcvmcomp ]; then
	/etc/init.d/hcvmcomp stop
	/bin/rm /etc/init.d/hcvmcomp
else
	if [ -f /etc/init.d/hcvmcomp.sh ]; then
		/etc/init.d/hcvmcomp.sh stop  >> .log_remove 2>&1
		/bin/rm /etc/init.d/hcvmcomp.sh  >> .log_remove 2>&1
	fi
fi
if [ -f /usr/bin/hcvmcomp ]; then
	/bin/rm /usr/bin/hcvmcomp
fi

sleep 3

echo "HC VM Component removed successfully"



