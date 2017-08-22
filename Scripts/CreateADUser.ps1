param(
    [Parameter(Mandatory=$true)]
    $Givenname,
    [Parameter(Mandatory=$true)]
    $Surname
)
$UserOU = "OU=Users,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com"
$Displayname = "$($Givenname) $($Surname)"
$SamAccountName = "$($Givenname).$($Surname)"
$PasswordCharacters = "ABCDEFGHJKLMNPQRSTUVWXYabcdefghijkmnpqrstuvwxy0123456789!@#$%&*()_-="
$Password = ""
while ($Password.Length -le 12)
{
    $Password += $PasswordCharacters[(Get-Random -Minimum 0 -Maximum $PasswordCharacters.Length)]
}
try
{
    New-ADUser -GivenName $Givenname -Surname $Surname -DisplayName $Displayname -Name $Displayname `
     -SamAccountName $SamAccountName -UserPrincipalName "$($SamAccountName)@corp.viamonstra.com" -Path $UserOU -Verbose
    Set-ADAccountPassword -Identity:"CN=$($Displayname),$($UserOU)" `
     -NewPassword:(ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force) -Reset:$true -Verbose
    Enable-ADAccount -Identity:"CN=$($Displayname),$($UserOU)" -Verbose
    Set-ADUser -ChangePasswordAtLogon:$true -Identity:"CN=$($Displayname),$($UserOU)" -Verbose
    Write-Output "Created the user account $($SamAccountName) with password '$($Password)' ."
}
catch
{
    Write-Error "Unable to create the user account $($SamAccountName)."
} 


