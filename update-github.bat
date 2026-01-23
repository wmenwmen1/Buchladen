@echo off
setlocal

REM ----------------------------------------
REM  Projektordner setzen
REM ----------------------------------------
cd /d C:\wmen\Programming\HTML\BookShop

echo ----------------------------------------
echo   GitHub Update wird gestartet...
echo ----------------------------------------

REM ----------------------------------------
REM  Prüfen, ob Git installiert ist
REM ----------------------------------------
git --version >nul 2>&1
if errorlevel 1 (
    echo Fehler: Git ist nicht installiert oder nicht im PATH.
    pause
    exit /b
)

REM ----------------------------------------
REM  Prüfen, ob ein Remote 'origin' existiert
REM ----------------------------------------
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo Fehler: Kein Remote 'origin' gefunden.
    echo Bitte einmal manuell ausführen:
    echo git remote add origin https://github.com/wmenwmen1/Buchladen.git
    pause
    exit /b
)

REM ----------------------------------------
REM  Änderungen hinzufügen
REM ----------------------------------------
git add .

REM ----------------------------------------
REM  Commit mit Standardnachricht
REM ----------------------------------------
git commit -m "Automatisches Update" >nul 2>&1

REM Wenn nichts zu committen ist, abbrechen
if errorlevel 1 (
    echo Keine Änderungen gefunden. Nichts zu committen.
    pause
    exit /b
)

REM ----------------------------------------
REM  Push versuchen
REM ----------------------------------------
echo Push wird ausgeführt...
git push origin main >pushlog.txt 2>&1

REM Prüfen, ob Authentifizierung erforderlich war
findstr /i "authentication" pushlog.txt >nul
if not errorlevel 1 (
    echo Authentifizierung erforderlich. Browser wird geöffnet...
    git push origin main
)

echo ----------------------------------------
echo   Update abgeschlossen!
echo ----------------------------------------

pause
endlocal
