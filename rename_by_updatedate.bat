@echo off
setlocal EnableDelayedExpansion

if "%~1"=="" (
  echo ファイルをこのbatにドラッグ＆ドロップしてください
  pause
  exit /b
)

for %%F in (%*) do (
  rem 作成日時を取得（1行まるごと）
  for /f "tokens=1,2 delims= " %%A in ('dir /TW "%%~fF" ^| find "%%~nxF"') do (
    set "date=%%A"
    set "time=%%B"
  )

  rem 日付整形（YYYYMMDD）
  set "y=!date:~0,4!"
  set "m=!date:~5,2!"
  set "d=!date:~8,2!"

  set "newname=!y!!m!!d!_%%~nxF"

  if not "%%~nxF"=="!newname!" (
    ren "%%~fF" "!newname!"
    echo %%~nxF → !newname!
  )
)

pause
