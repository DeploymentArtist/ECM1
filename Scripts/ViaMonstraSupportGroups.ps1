Configuration ViaMonstraLocalGroups
{
    param ($NodeName)

    Node $NodeName
    {
        Group SupportTechnicians
        {
            GroupName = "ViaMonstra Support Technicians"
            Ensure = "Present"
        }
    }
}

ViaMonstraLocalGroups -NodeName localhost

Start-DscConfiguration -Path $PSScriptRoot\ViaMonstraLocalGroups -Wait -Verbose -Force