@echo off
for %%i in (*.mp4) do (
call _trim2.bat "%%i"
)