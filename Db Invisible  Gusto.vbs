Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "F:\AppServ\www\Gusto\DB.bat" & Chr(34), 0
Set WshShell = Nothing
