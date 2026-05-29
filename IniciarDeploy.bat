```bat
@echo off
title DEPLOY TI - PREFEITURA DE OLINDA

echo =========================================
echo   DEPLOY TI - PREFEITURA DE OLINDA
echo =========================================
echo.

:: Vai para a pasta onde o BAT está
cd /d "%~dp0"

echo Iniciando DeployTI...
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -File ""%~dp0DeployTI.ps1""' -Verb RunAs"

exit
```
