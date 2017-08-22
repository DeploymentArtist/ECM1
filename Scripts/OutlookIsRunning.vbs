On Error Resume Next
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set colItems = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'outlook.exe'",,48)
If colItems.Count > 0 Then
    wscript.echo 0
Else
    wscript.echo 1
End If
