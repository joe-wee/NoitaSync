# NoitaSync
A batch utility for periodically backing up your Noita save file

The code here should be saved as a batch file in Windows and run as an administrator - LEAVE THE COMMAND PROMPT WINDOW OPEN if you want the monitoring to work.

Basically, this makes an initial clone of your save directory, then monitors the directory for changes, and copies new/modified files over every 5 minutes.

It's not perfect. If you happen to die WHILE it's copying files you might end up with a corrupted save since it wouldn't have EVERYTHING from the [world] folder.
Really once the initial backup is there, it shouldn't need to copy TOO MUCH info unless you're using a parallel world travel wand.
Conveniently, since dying basically just DELETES all the player/world files, you should never really lose anything that's already in the backup folder.

In theory, if you leave this running in the background, you should never lose more than 5 minutes of progress if you die.

If you die, simply exit the game, copy the contents of the "NoitaSaveBackup" folder to "%LOCALAPPDATA%Low\Nolla_Games_Noita\save00\" and overwrite any existing files to restore your save.

**If you need to start a new save, delete the entire backup folder**. By default the script is only doing a one-way copy, not a two-way mirror, so if you start a new save and try to restore from the backup without clearing out the folder first, you'll be dragging in a bunch of old [world] files from your last save.

You can edit any of these flags you like- here's a brief rundown. The ones you might want to modify are bolded:

**set source=** source folder you'd like to monitor - by default it's the locallow appdata folder where noita saves go

**set dest=** the destination folder where you'd like the backup to be stored - by default it's a new folder on your user profile's Desktop

/e - copies basically everything

/zb - copies in backup/restartable mode in case the transfer gets interrupted

/copyall - copies all file information

/dcopy:DAT - copies all directory information

**/mt:32 - MULTITHREADING** - this defines how many files it will attempt to copy at once. change the number as you wish - if it makes your computer shit itself, just remove it altogether

**/mot:5 - TIME TO CHECK FOR CHANGES IN MINUTES** - change this number if you want backups more or less often. Feel free to experiment- if you have a very nice gaming rig you could theoretically run it with **/MT:128 and /MOT:1** (copies up to 128 files at once, and runs once a minute) but that MAY end up causing issues (i think if you died and it made a new copy of your persistent files before you were able to restore, it could potentially cause problems since your player files might now reflect that you died).

/r:1 /w:1 - sets retry limit to 1 so it doesn't just stall forever

/NP /NJH /log+:%dest%\NoitaSync.txt - logging info - by default it appends changes to the end of a logfile called NoitaSync.txt in the same directory where the save backup is
