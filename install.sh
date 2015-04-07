#	!bin/bash
#	Installatie van ip-check
	vncClient="Merlijn Schoots"
	vncClientEmail="merlijnschoots@gmail.com"
	echo 
	echo 	
	echo "Check-IP is een eenvoudig programma waarmee uw computer ieder uur en bij iedere opstart het externe IP adres controleert. Indien dit IP adres verandert, wordt dit doorgegeven aan uw hulp op afstand via een email. Uw hulp op afstand heeft ten alle tijden het juiste IP adres nodig om op uw computer mee te kunnen kijken naar uw handelingen of eventuele probleem. In uw specifieke geval wordt er een email gestuurd naar $vncClient op het email adres $vncClientEmail" 
	echo 
	echo "LET OP: indien u deze persoon en dit email adres NIET herkend, ga dan NIET verder met installatie van dit programma!"
	echo 
	while true; do
	    read -p "Wilt u dit programma installeren?" answer
	    case $answer in
	        [Jj]* ) 
		echo ;
		echo "Check-IP wordt geinstalleerd..."; 
		echo ;		
		echo ;				
		tar xvfz checkip.tar.gz -C $HOME
		sudo chmod +x $HOME/checkip/checkip.sh
		echo ;
		echo "Check-IP is geinstalleerd. Postfix zal worden geinstalleerd zodat het IP adres per email verzonden kan worden aan $vncClient. Postfix opent een kort en eenvoudig configuratieprogramma. Beantwoord de eerste vraag met OK. En kies bij de volgende vraag voor internetsite. Bij de volgende vraag wordt de emailnaam van het systeem gevraagd, klik hierbij eenvoudig weg weer op OK."	
		echo ;		
		sudo apt-get install postfix		
		echo ;
		echo ;
		echo "Check-IP en Postfix zijn succesvol geinstalleerd!"
		echo "Check-IP timer wordt ingesteld..."
		echo ;		
		crontab -l > temp
		#echo new cron into cron file
		echo "@reboot $HOME/checkip/checkip.sh" >> temp
		echo "0 */4 * * * $HOME/checkip/checkip.sh" >> temp		
		#install new cron file
		crontab temp
		rm temp
		echo ;
		echo "Check-IP timer succesvol ingesteld!"
		echo "Check-IP installatie succesvol afgerond!"
		echo ;
		break;;
	        [Nn]* ) 
		echo ;
		echo "Installatie afgebroken op initiatief van "$USER;
		echo ; 
		exit;;
	        * ) 
		echo "Beantwoordt de vraag met ja of nee";;
	    esac
	done
