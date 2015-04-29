#!/bin/sh

# dynamic-ip-notifier repository installation

# Install information
echo
echo 
echo "dynamic-ip-notifier repository being read...done"
echo
echo "dynamic-ip-notifier dependencies being read...done"
echo
echo "during installation your system will probably request for sudo password"
echo
echo "Security vulnerabillities being read...done"
echo
echo "dynamic-ip-notifier will send your external ip adress to a chosen ssh server. This will make your system more vulnerable to security enforcements. As long as the server adress belongs to a reliable recipient, we consider using dynamic-ip-notifier as a safe procedure"
echo
while true; do
    read -p "Would you like to install dynamic-ip-notifier?" answer
    case $answer in
        [Yy]* ) 
	echo ;
	echo "Installing dynamic-ip-notifier..."; 
	echo ;		
	echo "Unpacking packages...";	
	tar xvfz ip-notifier.tar.gz -C $HOME
	echo "Installing packages...";		
	sudo chmod +x $HOME/ip-notifier/dynamic-ip-notifier.sh
	echo ;
	echo "Install sshpass..."
	sudo apt-get install sshpass	
	echo ; 
	echo "Adding cronjobs..."
	echo ;		
	crontab -l > temp
	#echo new cron into cron file
	echo "@reboot $HOME/ip-notifier/dynamic-ip-notifier.sh" >> temp
	echo "0 */4 * * * $HOME/ip-notifier/dynamic-ip-notifier.sh" >> temp		
	#install new cron file
	crontab temp
	rm temp
	echo ;
	echo "Configuring dynamic-ip-notifier";	
	echo ;
	read -p "What is the ssh server url or ip adress? (eg server.mydomain.com or 90.91.92.93)" serverAdress	
	read -p "What is the ssh server username?" serverUsername
	read -p "What is the ssh server password?" serverPassword
	echo "serverAdress="$serverAdress >> $HOME/ip-notifier/config/config.ini
	echo "serverUsername="$serverUsername >> $HOME/ip-notifier/config/config.ini	
	echo "serverPassword="$serverPassword >> $HOME/ip-notifier/config/config.ini
	echo ;
	echo "dynamic-ip-notifier succesfully installed in $HOME/ip-notifier. To manually change the recipient email, change the email adress saved in $HOME/ip-notifier/config/config.ini" ;
	echo ;
	echo "remove installation directory..." ;
	sudo rm -R $HOME/dynamic-ip-notifier ;
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
