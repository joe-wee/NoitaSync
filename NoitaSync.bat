@echo off
:paths
set source=%LOCALAPPDATA%Low\Nolla_Games_Noita\save00\
set dest=%HOMEPATH%\Desktop\NoitaSync\

:directorycheck
if not exist %dest% (
    md %dest% 2>nul
    IF not errorlevel 1 (
    GOTO backup
 )
ELSE goto exit
)

:backup
robocopy %source% %dest% * /e /zb /copyall /dcopy:DAT /mt:32 /r:1 /w:1 /mot:2 /NJH /log+:%dest%\NoitaSyncLog.txt

:exit
pause
