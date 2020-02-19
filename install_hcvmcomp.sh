#!/bin/bash
if [ -f /usr/bin/hcvmcomp ]; then
	echo "HC VM Component is already installed, please first remove it by running script uninstall_hcvmcomp.sh"
	exit 1
fi
echo "Installing HC VM Component, please wait ..."
cp ./hcvmcomp /usr/bin/hcvmcomp
chmod 755 /usr/bin/hcvmcomp
cp ./hcvmcomp.sh /etc/init.d/hcvmcomp
chmod 755 /etc/init.d/hcvmcomp
if [ -f /usr/sbin/update-rc.d ]; then
	/usr/sbin/update-rc.d hcvmcomp defaults  >> .log_install 2>&1        	
else 	     
	cp ./S99hcvmcomp /etc/rc3.d/.
	chmod 755 /etc/rc3.d/S99hcvmcomp
	cp ./S99hcvmcomp /etc/rc5.d/.
	chmod 755 /etc/rc5.d/S99hcvmcomp
	cp ./S99hcvmcomp /etc/rc2.d/.
	chmod 755 /etc/rc2.d/S99hcvmcomp
	cp ./K99hcvmcomp /etc/rc0.d/.
	chmod 755 /etc/rc0.d/K99hcvmcomp
	cp ./K99hcvmcomp /etc/rc6.d/.
	chmod 755 /etc/rc6.d/K99hcvmcomp
fi
#/etc/init.d/hcvmcomp start
sleep 3
echo "HC VM Component installed successfully"
