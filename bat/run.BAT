@echo off
echo Hello World
setlocal ENABLEDELAYEDEXPANSION
set keyword=InsertHere

REM save all the txt files need to be processed into a file
dir "%CD%\"*.txt /b /o-d > fileslist.txt

REM make a resut directory if not exist
if not exist %CD%\result\ mkdir %CD%\result\


REM loop through all the files in the filelist file:
for /f "tokens=*" %%s in (fileslist.txt) do (
	set filename=%%s

REM this is the trick you should notice, "echo filename" will not work here
	echo ========================Now I am processing !filename!=======================

	for /f "tokens=*" %%f in ('type "!filename!"') do (	
		set currentline=%%f
		If "!currentline!" == "%keyword%" (echo I foud a match>>%CD%\result\!filename! ) else (echo !currentline!>>%CD%\result\!filename!)
	
	)
)

PAUSE