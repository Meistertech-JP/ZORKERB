@echo off
rem ZORKERB-I: double-click to play. Needs Python 3.10 or later.
cd /d "%~dp0"
python PyEmuera-3.0.0.pyz ZORKERB-I
if errorlevel 9009 echo Python was not found. Install Python 3.10 or later.
pause
