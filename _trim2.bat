@echo off
for /f "tokens=*" %%a in ('ffprobe -show_format -i %1 ^| find "duration"') do set _duration=%%a
set _duration=%_duration:~9%
for /f "delims=. tokens=1*" %%b in ('echo %_duration%') do set /a "_durS=%%b"
for /f "delims=. tokens=2*" %%c in ('echo %_duration%') do set "_durMS=%%c"
rem following line is seconds to cut
set /a "_durS-=4"
set "_newduration=%_durS%.%_durMS%"
set "_output=%~n1"
md _fixed
ffmpeg -ss 4 -i %1 -t %_newduration% -c copy "_fixed\%_output%.mp4"