@echo off
rem ************************************************************************
rem *
rem *        Name : Backup.bat
rem *
rem * Description : MS DOS script file for zipping up a source directory
rem *               and transferring it to a backup directory.
rem *
rem * Parameters  : 1 - SourceDir : directory to be backed-up
rem *
rem *               2 - TargetDir : backup directory the zip file is to be 
rem *                           transferred to.
rem *
rem *
rem ************************************************************************


rem Add rar path

set path="C:\Program Files\WinRAR\";%path%

rem set directory to backup from
set SourceDir=%1

rem set directory to backup to
set TargetDir=%2


rem ************** check input parameters *********************


rem ** check if parameters are missing
if [%1] == [] GOTO ERRORPARAMMISSING
if [%2] == [] GOTO ERRORPARAMMISSING


rem ** check if specified source dir exists 
if not exist %1 GOTO ERRORSOURCEDIRNOTEXIST

rem ** check if specified target dir exists 
if not exist %2 GOTO ERRORTARGETDIRNOTEXIST



echo backing up from %1 to %2




rem ************** construct name of rar file ******************
set RarFileName=%BackupDir%

rem get date, replacing / with _
set FileDate=%Date:/=_%
 
rem remove spaces from date
set FileDate=%FileDate: =%

rem get time, replacing : with _
set FileTime=%Time::=_%

rem replace . with _ in time
set FileTime=%FileTime:.=_%

rem remove any spaces from time
set FileTime=%FileTime: =%


set RarFileName=%SourceDir%_%FileDate%_%FileTime%.rar



rem **** create compressed file *******
rar a -hphamlet %RarFileName% %SourceDir%

rem **** transfer compressed file over to backup dir *****
copy %RarFileName% %TargetDir%











goto END

:ERRORSOURCEDIRNOTEXIST
echo bel
echo ************************ ERROR! **************************
echo Error - specified source directory does not exist
goto END

:ERRORTARGETDIRNOTEXIST
echo bel
echo ************************ ERROR! **************************
echo Error - specified target directory does not exist
goto END


:ERRORPARAMMISSING
echo bel
echo ************************ ERROR! **************************
echo Error - Parameter(s) missing
goto END



:END





pause