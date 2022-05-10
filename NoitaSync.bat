@echo off
set source=%LOCALAPPDATA%Low\Nolla_Games_Noita\save00\
set dest=%HOMEPATH%\Desktop\NoitaSync\

md %dest%

robocopy %source% %dest% * /e /zb /copyall /dcopy:DAT /mt:32 /r:1 /w:1 /mot:5 /NJH /log+:%dest%\NoitaSyncLog.txt
