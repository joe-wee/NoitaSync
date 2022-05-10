# NoitaSync
A batch utility for periodically backing up your Noita save file

The code here should be saved as a batch file in Windows and run as an administrator - LEAVE THE COMMAND PROMPT WINDOW OPEN if you want the monitoring to work.

Basically, this makes an initial clone of your save directory, then monitors the directory for changes, and copies new/modified files over every 5 minutes.

**Disclaimer:**

I am not responsible for any lost data - AS IS, this is theoretically completely safe to use, but **if you modify the flags or variables without knowing what you're doing** you could completely fuck up your computer. Seriously, Robocopy would mirror an empty directory over your whole C: drive if you told it to. Don't dick around with it if you don't know what you're doing. If you insist on modifying the script, slap a big **/L** on the end - that will basically put it into "what if?" mode and just write everything IT WOULD HAVE DONE into the log file, instead of actually doing it.

**Issues:**

It's not perfect. If you happen to die WHILE it's copying files you might end up with a corrupted save since it wouldn't have EVERYTHING from the [world] folder.
Really once the initial backup is there, it shouldn't need to copy TOO MUCH info unless you're using a parallel world travel wand.
Conveniently, since dying basically just DELETES all the player/world files, you should never really lose anything that's already in the backup folder.

**To Restore:**

If you die, simply exit the game, copy the contents of the "NoitaSaveBackup" folder to "%LOCALAPPDATA%Low\Nolla_Games_Noita\save00\" and overwrite any existing files to restore your save.

**If you need to start a new save, delete the entire backup folder**. By default the script is only doing a one-way copy, not a two-way mirror, so if you start a new save and try to restore from the backup without clearing out the folder first, you'll be dragging in a bunch of old [world] files from your last save.

**Tweaks:**

You can edit any of these flags at your own risk - here's a brief rundown. The ones you might actually want to modify are bolded, but don't do so without knowing what you're doing:

**set source=** source folder you'd like to monitor - by default it's the locallow appdata folder where noita saves go

**set dest=** the destination folder where you'd like the backup to be stored - by default it's a new folder on your user profile's Desktop - you can hard-code this to any directory. DO NOT use drive letters if you're trying to back this up to a network share of some sort. Robocopy only takes full UNC paths *i.e.* \\servername\share\folder not G:\MyBackups\ (where G: is the drive letter you assigned to a mapped network share)

/e - copies all directories, even empty ones

/zb - copies in backup/restartable mode in case the transfer gets interrupted

/copyall - copies all file information

/dcopy:DAT - copies all directory information

**/mt:32 - MULTITHREADING** - this defines how many files it will attempt to copy at once. change the number as you wish - if it makes your computer shit itself, you can remove it altogether

**/mot:5 - TIME TO CHECK FOR CHANGES IN MINUTES** - change this number if you want backups more or less often. Feel free to experiment- if you have a very nice gaming rig you could theoretically run it with **/MT:128 and /MOT:1** (copies up to 128 files at once, and runs once a minute) but that MAY end up causing issues (i think if you died and it made a new copy of your persistent files before you were able to restore, it could potentially cause problems since your player files might now reflect that you died).

/r:1 /w:1 - sets retry limit to 1 so it doesn't just stall forever

/NP /NJH /log+:%dest%\NoitaSync.txt - logging info - by default it appends changes to the end of a logfile called NoitaSync.txt in the same directory where the save backup is. You can remove this if you don't give a shit about the log.
