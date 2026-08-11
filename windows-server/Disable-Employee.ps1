<#
.SYNOPSIS
    Automates the offboarding and containment of Active Directory users.
.DESCRIPTION
    Instantly disables an AD account, scrambles the password to a complex random string,
    strips the user of all security group memberships (except Domain Users), and 
    moves the account to a quarantine OU.
#>

param (
    [Parameter(Mandatory=$true)][string]$Username
)

$TargetUser = Get-ADUser -Identity $Username -Properties MemberOf
$QuarantineOU = "OU=Disabled Users,DC=securelab,DC=local" 

try {
    Write-Host "Initiating containment protocol for $Username..." -ForegroundColor Yellow

    # 1. Disable the Account
    Disable-ADAccount -Identity $Username
    Write-Host "[+] Account disabled." -ForegroundColor Green

    # 2. Scramble the Password (generates a random 32-character string)
    $RandomPassword = [guid]::NewGuid().ToString() + "A1!"
    $SecureRandom = ConvertTo-SecureString $RandomPassword -AsPlainText -Force
    Set-ADAccountPassword -Identity $Username -NewPassword $SecureRandom -Reset 
    Write-Host "[+] Password scrambled and reset." -ForegroundColor Green

    # 3. Strip All Security Group Memberships (except the default Primary Group)
    $UserGroups = $TargetUser.MemberOf
    foreach ($Group in $UserGroups) {
        Remove-ADGroupMember -Identity $Group -Members $Username -Confirm:$false
        Write-Host "[+] Removed from group: $Group" -ForegroundColor Green
    }

    # 4. Move to Quarantine OU
    Move-ADObject -Identity $TargetUser.ObjectGUID -TargetPath $QuarantineOU
    Write-Host "[+] Account quarantined to Disabled Users OU." -ForegroundColor Green

    Write-Host "Offboarding complete. Account is fully contained." -ForegroundColor Cyan
}
catch {
    Write-Host "[-] Failed to offboard user. Error: $_" -ForegroundColor Red
}
