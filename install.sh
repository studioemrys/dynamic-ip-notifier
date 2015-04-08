#!bin/bash

# dynamic-ip-notifier repository installation

# Install information
echo
echo 
echo "dynamic-ip-notifier repository being read...done"
echo "dynamic-ip-notifier repository dependencies being read...done"
echo "dynamic-ip-notifier requires following packages to be installed:"
echo "	- postfix"
echo
echo "during installation your system will probably request for sudo password"
echo
echo "Security vulnerabillities being read...done"
echo
echo "dynamic-ip-notifier will email your external ip adress to a chosen email adress. This will make your system more vulnerable to security enforcements. As long as the email adress belongs to a reliable recipient, we consider using dynamic-ip-notifier as a safe procedure"
echo
while true; do
    read -p "Would you like to install dynamic-ip-notifier?" answer
    case $answer in
        [Yy]* ) 
	echo ;
	echo "Installing dynamic-ip-notifier..."; 
	echo ;		
	echo "Unpacking packages...";	
	tar xvfz dynamic-ip-notifier.tar.gz -C $HOME
	echo "Installing packages...";		
	sudo chmod +x $HOME/dynamic-ip-notifier/dynamic-ip-notifier.sh
	echo "Installing postfix...";
	echo "Postfix will be installed on your system. During installation a configuration menu will popup. At the first screen hit 'OK'. At the second screen hit 'internetsite'. At the third screen do not alter anything and hit 'OK'."	
	echo ;		
	sudo apt-get install postfix		
	echo ;
	echo ; 
	echo "Adding cronjobs..."
	echo ;		
	crontab -l > temp
	#echo new cron into cron file
	echo "@reboot $HOME/dynamic-ip-notifier/dynamic-ip-notifier.sh" >> temp
	echo "0 */4 * * * $HOME/dynamic-ip-notifier/dynamic-ip-notifier.sh" >> temp		
	#install new cron file
	crontab temp
	rm temp
	echo ;
	echo "Configuring dynamic-ip-notifier";	
	read -p "To which email adress would you like to send a notification email when the external IP adress changes?" vncClientEmail
	echo $vncClientEmail > $HOME/dynamic-ip-notifier/config/config.ini	
	echo ;
	echo "dynamic-ip-notifier succesfully installed!" ;
	echo ;
	break;;
        [Nn]* ) 
	echo ;
	echo "Installation cancelled by $USER";
	echo ; 
	exit;;
        * ) 
	echo "Please answer (y)es or (n)o";;
    esac
done
