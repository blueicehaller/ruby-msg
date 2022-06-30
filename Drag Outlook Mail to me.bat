@echo off

set input=%1
set output=%input:msg=eml%
if exist %output% (
    echo The target file %output% 
	echo exist so it will not created again and the target file opened.
    ping -n 4 localhost > NUL
    ) else (
		echo Converting %input% 
		echo using mapitool and then open the target file 
		echo %output%.
		ping -n 4 localhost > NUL
		mapitool.exe -si %1 > %output%
	)

if exist "C:\Program Files (x86)\Notepad++\notepad++.exe" (
    call "C:\Program Files (x86)\Notepad++\notepad++.exe" %output%
	) else if exist "C:\Program Files\Notepad++\notepad++.exe" (
		call "C:\Program Files\Notepad++\notepad++.exe" %output%
    ) else (
		start notepad %output%
    )

goto :eof
