New-ADUser -Name:"SM_RAA_AD" -Path:"OU=Service Accounts,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com" -SamAccountName:"SM_RAA_AD" -Type:"user" -UserPrincipalName:"SM_RAA_AD@corp.viamonstra.com" -Verbose
Set-ADAccountPassword -Identity:"CN=SM_RAA_AD,OU=Service Accounts,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com" -NewPassword:(ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force) -Reset:$true -Verbose
Enable-ADAccount -Identity:"CN=SM_RAA_AD,OU=Service Accounts,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com" -Verbose
Set-ADAccountControl -AccountNotDelegated:$false -AllowReversiblePasswordEncryption:$false -CannotChangePassword:$true -DoesNotRequirePreAuth:$false -Identity:"CN=SM_RAA_AD,OU=Service Accounts,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com" -PasswordNeverExpires:$true -UseDESKeyOnly:$false -Verbose
Set-ADUser -ChangePasswordAtLogon:$false -Identity:"CN=SM_RAA_AD,OU=Service Accounts,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com" -SmartcardLogonRequired:$false –Verbose
