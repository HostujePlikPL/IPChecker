
@echo off
REM Batch script for checking IP addresses
REM Author: 33mb_
REM Date: 13.05.2024
REM Version: 1.0.0
REM GitHub Repository: https://github.com/HostujePlikPL/IPChecker

REM Copyright (C) 2024 33mb_
REM 
REM This program is free software: you can redistribute it and/or modify
REM it under the terms of the GNU General Public License as published by
REM the Free Software Foundation, either version 3 of the License, or
REM (at your option) any later version.
REM 
REM This program is distributed in the hope that it will be useful,
REM but WITHOUT ANY WARRANTY; without even the implied warranty of
REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM GNU General Public License for more details.
REM 
REM You should have received a copy of the GNU General Public License
REM along with this program.  If not, see <https://www.gnu.org/licenses/>.

REM NOTICE: You are not allowed to modify, publish, or distribute this script
REM without proper attribution to the original author (33mb_) and linking
REM back to the original source on GitHub.
setlocal enabledelayedexpansion
color 0e
title IPChecker by 33mb_ v1.0.0
echo ___       _________ .__                   __                 
echo ^|   ^|_____ \_   ___ \^|  ^|__   ____   ____ ^|  ^| __ ___________  v1.0.0
echo ^|   \____ \/    \  \/^|  ^|  \_/ __ \_/ ___\^|  ^|/ // __ \_  __ \
echo ^|   ^|  ^|^_^> ^>     \___^|   Y  \  ___/\  \___^|    ^<\  ___/^|  ^| \/
echo ^|___^|   __/ \______  /___^|  /\___  ^>\___  ^>__^|_ \\___  ^>__^|   
echo     ^|__^|           \/     \/     \/     \/     \/    \/     by 33mb_ (HostujePlikPL)
echo : https://github.com/HostujePlikPL/IPChecker
set /p inputFile="Path of IP's file (Example: ip.txt): "
if not exist "!inputFile!" (
    echo File is Incorrect.
    pause >nul
)

set /p outputFile="Correct IP's file (Example: correct.txt): "
if exist "!outputFile!" (
    del "!outputFile!"
)

set "totalChecked=0"
set "totalCorrect=0"
set "totalIncorrect=0"

for /f %%i in ('type "!inputFile!" ^| find /c /v ""') do set "totalAddresses=%%i"

for /f "tokens=* delims=" %%a in (!inputFile!) do (
    ping -n 1 -w 1000 %%a >nul
    if !errorlevel! equ 0 (
        echo %%a >> "!outputFile!"
        set /a "totalCorrect+=1"
    ) else (
        set /a "totalIncorrect+=1"
    )
	cls
    set /a "totalChecked+=1"
	echo Thanks for using my program! https://github.com/HostujePlikPL/IPChecker
    echo Checked: !totalChecked!/!totalAddresses!
    echo Correct: !totalCorrect!
    echo Incorrect: !totalIncorrect!
	title !totalChecked!/!totalAddresses! IPChecker by 33mb_ 
    echo.
)
    echo The Correct ip's has been saved in !outputFile!.
pause >nul
