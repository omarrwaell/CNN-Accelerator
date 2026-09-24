@echo off
setlocal EnableExtensions

pushd "%~dp0"

if /I "%~1"=="--help" goto usage_ok
if /I "%~1"=="-h" goto usage_ok

if "%~1"=="" (
    set "IMAGE_PATH=test_images\shapes\sphere.png"
) else (
    set "IMAGE_PATH=%~1"
)

if "%~2"=="" (
    set "IMG_WIDTH="
) else (
    set "IMG_WIDTH=%~2"
)

set "WIDTH_FILE=sim\results_hex\img_width.txt"

if not exist "%IMAGE_PATH%" (
    echo ERROR: image file not found: %IMAGE_PATH%
    goto fail
)

if not "%IMG_WIDTH%"=="" (
    call :validate_width "%IMG_WIDTH%"
    if errorlevel 1 goto usage
)

echo ============================================================
echo CNN image flow
echo Image:     %IMAGE_PATH%
if "%IMG_WIDTH%"=="" (
    echo IMG_WIDTH: auto from Python
) else (
    echo IMG_WIDTH: %IMG_WIDTH%
)
echo ============================================================

echo.
echo [1/3] Generating golden hex files...
if "%IMG_WIDTH%"=="" (
    python python\golden_model_image_flow.py "%IMAGE_PATH%"
) else (
    python python\golden_model_image_flow.py "%IMAGE_PATH%" --img-width %IMG_WIDTH%
)
if errorlevel 1 goto fail

if not exist "%WIDTH_FILE%" (
    echo ERROR: Python did not write %WIDTH_FILE%.
    goto fail
)

for /f "usebackq tokens=1" %%W in ("%WIDTH_FILE%") do set "IMG_WIDTH=%%W"
call :validate_width "%IMG_WIDTH%"
if errorlevel 1 goto fail

echo Resolved IMG_WIDTH from Python: %IMG_WIDTH%

echo.
echo [2/3] Running Questa/ModelSim image tests IMG-TC1..TC16...
vsim -c -do "do sim/scripts/run_all_image_tests.do %IMG_WIDTH%"
if errorlevel 1 goto fail

echo.
echo [3/3] Rendering hardware outputs...
python python\visualize_hw_outputs.py --img-width %IMG_WIDTH%
if errorlevel 1 goto fail

echo.
echo ============================================================
echo Flow complete.
echo Hex files:    sim\results_hex
echo Images:       sim\image outputs
echo SAIF:         sim\imgtc1_active.saif
if not "%IMG_WIDTH%"=="32" echo NOTE: the SAIF matches the synthesized design only at IMG_WIDTH=32.
echo ============================================================

popd
exit /b 0

:usage
echo Usage:
echo   run_image_flow.bat [image_path] [optional_IMG_WIDTH]
echo.
echo Examples:
echo   run_image_flow.bat
echo   run_image_flow.bat test_images\shapes\sphere.png
echo   run_image_flow.bat test_images\photos\nyc.jpg 360
popd
exit /b 1

:usage_ok
echo Usage:
echo   run_image_flow.bat [image_path] [optional_IMG_WIDTH]
echo.
echo Examples:
echo   run_image_flow.bat
echo   run_image_flow.bat test_images\shapes\sphere.png
echo   run_image_flow.bat test_images\photos\nyc.jpg 360
popd
exit /b 0

:validate_width
echo(%~1| findstr /R "^[1-9][0-9]*$" >nul
if errorlevel 1 (
    echo ERROR: IMG_WIDTH must be an integer greater than or equal to 3.
    exit /b 1
)
if %~1 LSS 3 (
    echo ERROR: IMG_WIDTH must be an integer greater than or equal to 3.
    exit /b 1
)
exit /b 0

:fail
echo.
echo Flow failed.
popd
exit /b 1
