Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "D:\AppServ\www\Gusto\serve.bat" & Chr(34), 0
Set WshShell = Nothing
