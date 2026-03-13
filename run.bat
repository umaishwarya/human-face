@echo off
setlocal enabledelayedexpansion
title SensiGAN Alpha - Neural Engine

echo ===================================================
echo   SensiGAN Alpha - Neural Synthesis Dashboard
echo ===================================================
echo.

:: 1. Search for Python in various locations
set PY_EXE=
set SEARCH_PATHS=python.exe py.exe python3.exe

for %%P in (%SEARCH_PATHS%) do (
    where %%P >nul 2>1
    if !errorlevel! == 0 (
        for /f "tokens=*" %%I in ('where %%P') do (
            :: Check if it's the valid one (not the Windows Store placeholder)
            if not "%%I"=="C:\Users\%USERNAME%\AppData\Local\Microsoft\WindowsApps\python.exe" (
                set PY_EXE=%%I
                goto found
            )
        )
    )
)

:: Check specific common paths if not found
set COMMON_PATHS="C:\Python312\python.exe" "C:\Python311\python.exe" "C:\Python310\python.exe" "C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python312\python.exe" "C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python311\python.exe" "C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python310\python.exe"

for %%A in (%COMMON_PATHS%) do (
    if exist %%A (
        set PY_EXE=%%A
        goto found
    )
)

echo [!] ERROR: Python 3.8+ was not found in your PATH or common locations.
echo.
echo Please follow these steps:
echo 1. Download Python from: https://www.python.org/downloads/
echo 2. IMPORTANT: Check "Add Python to PATH" during installation.
echo 3. Restart this terminal/batch file.
echo.
pause
exit /b

:found
echo [✓] Neural engine found: %PY_EXE%
echo [!] Synchronizing dependencies...
"%PY_EXE%" -m pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [!] WARNING: Dependency sync had errors. Retrying...
    "%PY_EXE%" -m pip install flask torch torchvision pillow numpy
)

echo.
echo [✓] Starting Flask server on http://localhost:5000
echo.
"%PY_EXE%" app/app.py
pause
