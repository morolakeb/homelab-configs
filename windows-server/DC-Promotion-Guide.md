# Windows Server 2022: Domain Controller Promotion Guide

## Overview
This document outlines the architectural steps taken to promote a standalone Windows Server 2022 instance to a Primary Domain Controller (PDC). This server acts as the root of the `securelab.local` forest, providing centralized Active Directory Domain Services (AD DS) and DNS resolution for the enterprise homelab.

## Prerequisites Configured
Before promoting the server, the following baseline configurations were established:
* **Static IP Addressing:** Assigned a static IPv4 address outside the DHCP scope to ensure reliable DNS resolution.
* **DNS Configuration:** Pointed the server's primary DNS server to its own local loopback address (`127.0.0.1`) to prepare for the integrated DNS server role.
* **Hostname Resolution:** Renamed the server from the default Windows-generated string to a standard naming convention (e.g., `DC01`).

## Phase 1: Installing the AD DS Role
The Active Directory Domain Services role and associated management tools were installed to prepare the server for promotion.

**PowerShell Execution:**
```powershell
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

## Phase 2: Promoting to a Domain Controller
Once the AD DS binaries were installed, the server was promoted to create a new forest root domain named `securelab.local`.

**PowerShell Execution:**
```powershell
Install-ADDSForest `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "WinThreshold" `
    -DomainName "securelab.local" `
    -DomainNetbiosName "SECURELAB" `
    -ForestMode "WinThreshold" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true
