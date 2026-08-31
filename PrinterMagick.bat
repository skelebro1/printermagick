@echo off
setlocal EnableDelayedExpansion

cd /d "%~dp0"

set "IN=%CD%"
set "OUT=%CD%\output"

if not exist "%OUT%" mkdir "%OUT%"

echo Processing images...

for %%F in (*.jpg *.jpeg) do (
    echo Processing %%~nxF...
    call :Process "%%~fF"
)

echo.
echo Creating PDF...

pushd "%OUT%"

set "FILES="
for %%F in (*.jp*) do set "FILES=!FILES! "%%F""

if not defined FILES (
    echo No processed images found.
    popd
    exit /b 1
)

call magick !FILES! scans.pdf

popd

echo.
echo Done.
pause
exit /b

:Process
magick %1 ^
-auto-orient ^
-colorspace Gray ^
-deskew 40%% ^
( +clone -blur 0x35 ) ^
-compose DivideSrc -composite ^
-normalize ^
-contrast-stretch 0.5%%x0.5%% ^
-lat 25x25-10%% ^
-despeckle ^
"%OUT%\%~nx1"

exit /b