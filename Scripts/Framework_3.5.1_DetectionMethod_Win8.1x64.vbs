strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set oss = objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
for each os in oss
    if Left(os.version,3) = "6.3" AND os.OperatingSystemSKU < 7  then
    Set colItems = objWMIService.ExecQuery("Select * from Win32_OptionalFeature WHERE installstate='1' AND Name='NetFx3'")
        If colItems.Count > 0 then
            wscript.echo "Passed!"
        End If
    End if
Next
