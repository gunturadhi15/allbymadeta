@echo off
title Membuka ALLBYMADETA dengan Musik MusikNew Otomatis
echo ===================================================
echo Membuka ALLBYMADETA dengan Autoplay Musik Aktif...
echo ===================================================

:: Prioritaskan Google Chrome dengan bypass kebijakan autoplay lokal
start "" chrome.exe --autoplay-policy=no-user-gesture-required "%~dp0index.html"
if %ERRORLEVEL% EQU 0 goto end

:: Fallback jika Chrome tidak di path default, coba Microsoft Edge
start "" msedge.exe --autoplay-policy=no-user-gesture-required "%~dp0index.html"
if %ERRORLEVEL% EQU 0 goto end

:: Fallback standar browser default
start "" "%~dp0index.html"

:end
exit
