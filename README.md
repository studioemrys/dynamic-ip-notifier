# dynamic-ip-notifier
## Info
dynamic-ip-notifier is a piece of software written for linux Debian variants (ubuntu, linux-mint, debian etc). When installed, it will regularly check the external IP adress of its host and compare it to the last but one known IP adress of the same host. If a change has occured, dynamic-ip-notifier will send an email to a user declared recipient emailadress. To send emails it uses postfix which will be downloaded during the installation process from the original linux repositories via apt-get. 

## Reason
I have written this piece so I can always locate my server on the internet although it is connected to the internet with a dynamic external IP adress. My internet providers has no free static IP adresses and I am not willing to pay for DynDNS services. I consider this as a cheap DIY solution to my problem which I would like to share with others.

## Installation Guide
Installing dynamic-ip-notifier is simple although one has to use 'git' and run a shell script in the terminal. Hopefully this guide will even help the linux newbies among us.

Open the linux terminal with the key combination:
<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CONTROL - ALT - T

This will popup a kind of DOS like screen. To make sure you are in the home folder, go to it by typing:
<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd $HOME

Now install a programme called 'git' on your system:
<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sudo apt-get install git

With 'git' you can download the dynamic-ip-notifier installation software to your home folder:
<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;git clone http://github.com/studioemrys/dynamic-ip-notifier

This will install the dynamic-ip-notifier in a folder called dynamic-ip-notifier. Go inside that folder by:
<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd dynamic-ip-notifier

Inside the folder is a so called shell script called install.sh. In order to run this script you still have to make it executable:
<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;chmod +x install.sh

Now you can run the installation script:
<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./install.sh

The script will create a new folder in your home folder called ip-notifier. Here it will install the required software. 

Than a programme called 'postfix' will be installed. You will be requested for your system password. Type it in although no characters will appear nor will the cursor move, and hit ENTER. During installation of 'postfix' a configuration menu will appear with 3 consecutive questions. Answer the first question with your only option: 'OK'. Answer the second question with 'internetsite'. And answer your last question with 'OK' without altering anything.

At last the installation will ask for a email recipient adress. You can type down your email adress and hit ENTER. If you want to change your email adress after installation:
<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nano $HOME/ip-notifier/config/config.ini
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;change the email adress and hit:
<br>
<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CONTROL-W
<br>
<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CONTROL-X

Now you can close the terminal and reboot your computer. After reboot a mail will be sent to the recipient email adress with a notice that it's IP adress has changed from 0.0.0.0 to (your external IP).

PLEASE NOTICE:
Often the notification email will be but in your spambox. Please contact your emailprovider how to unspam this particular email in the future (eg for Gmail there is a special unspam button).
