# NoitaSync
A batch utility for periodically backing up your Noita save file

The code here should be saved as a batch file in Windows and run as an administrator - LEAVE THE COMMAND PROMPT WINDOW OPEN if you want the monitoring to work.
Basically, this makes an initial clone of your save directory, then monitors the directory for changes, and copies new files over every 5 minutes.

You can edit any of these flags you like- here's a brief rundown

set source= source folder you'd like to monitor - by default it's the locallow appdata folder where noita saves go
set dest= the destination folder where you'd like the backup to be stored - by default it's a new folder on your user profile's Desktop

/e - copies basically everything
/zb - copies in backup/restartable mode in case the transfer gets interrupted
/copyall - copies all file information
/dcopy:DAT - copies all directory information
/mt:32 - MULTITHREADING - this defines how many files it will attempt to copy at once. change the number as you wish - if it makes your computer shit itself, just remove it altogether
/r:1 /w:1 - sets retry limit to 1 so it doesn't just stall forever
/mot:5 - TIME TO CHECK FOR CHANGES IN MINUTES - change this number if you want backups more or less often
/NP /NJH /log+:%dest%\NoitaSync.txt - logging info - by default it appends changes to the end of a logfile called NoitaSync.txt in the same directory where the save backup is
