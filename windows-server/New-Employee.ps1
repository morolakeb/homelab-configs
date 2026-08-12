
<#
.SYNOPSIS
    Automates the onboarding of new Active Directory users.
.DESCRIPTION
    Creates a new AD user, sets a secure temporary password, forces a password 
    reset on first login, and assigns the user to a specified security group.
#>

param (
    [Parameter(Mandatory=$true)][string]$FirstName,
    [Parameter(Mandatory=$true)][string]$LastName,
    [Parameter(Mandatory=$true)][string]$DepartmentGroup,
    [Parameter(Mandatory=$false)][string]$OfficeLocation = "Wesley Chapel HQ"
)

# 1. Define Standardized Variables
$Username = "$($FirstName.Substring(0,1).ToLower())$($LastName.ToLower())" 
$UserPrincipalName = "$Username@securelab.local" 

$SecurePassword = Read-Host -Prompt "Enter a temporary password for $($Username)" -AsSecureString

# 2. Define the Target Organizational Unit (OU)
$TargetOU = "OU=Employees,DC=securelab,DC=local" 

try {
    Write-Host "Starting provisioning for $FirstName $LastName ($Username)..." -ForegroundColor Cyan

    # 3. Create the Active Directory User
    New-ADUser -Name "$FirstName $LastName" `
               -GivenName $FirstName `
               -Surname $LastName `
               -SamAccountName $Username `
               -UserPrincipalName $UserPrincipalName `
               -Path $TargetOU `
               -AccountPassword $SecurePassword `
               -ChangePasswordAtLogon $true `
               -Enabled $true `
               -Office $OfficeLocation

    Write-Host "[+] User account created successfully." -ForegroundColor Green

    # 4. Assign User to Department Security Group
    Add-ADGroupMember -Identity $DepartmentGroup -Members $Username
    Write-Host "[+] Added $Username to the $DepartmentGroup group." -ForegroundColor Green

}
catch {
    Write-Host "[-] Failed to provision user. Error: $_" -ForegroundColor Red
}
