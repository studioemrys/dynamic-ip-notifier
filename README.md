# dynamic-ip-notifier
Dynamic IP notifier is a shell script for linux Debian variants (e.g. ubuntu, linux mint, debian). It regularly 
checks a computer external IP adress. If the adress has changed than an email will be send to a user declared emailadres.

This script can be useful for linux computers behind dynamic IP adresses that need to be visited once in a while. For
example a ubuntu server or a linux mint computer with a shared desktop could make good use of this script.

#Installation guide
Install git from your package manager:
  
<b>&nbsp;$ sudo apt-get install git
  
Go to your home folder to download the installation software:

<b>&nbsp;$ cd $HOME
  
Download the installation software from git:

<b>&nbsp;$ git clone http://github.com/studioemrys/dynamic-ip-notifier
  
Go to 
