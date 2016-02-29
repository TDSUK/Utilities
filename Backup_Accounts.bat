@echo off

echo Starting backup

rem do normal backup
call "C:\vss\DoBackup.bat" "C:\personal\Accounts" d:\backup



rem copy over invoice pdfs

del /Q d:\backup_pdf\*.*

copy /Y "C:\jez_personal\CV_stuff\2014\contractor\LTDCompanySetup\SJD Starter Pack\Accounts\invoices\*.pdf" d:\backup_pdf



pause