# Windows Server 2022 & Active Directory Infrastructure

## Overview
This directory contains the configuration notes, Group Policy Object (GPO) backups, and identity management documentation for the Active Directory (AD) environment within my enterprise homelab.

Running on Windows Server 2022, this domain controller serves as the primary identity provider for the simulated enterprise network. This environment is specifically engineered to practice Identity and Access Management (IAM) principles, implement secure baseline configurations, and generate high-fidelity authentication logs for SIEM ingestion and threat hunting.

## Environment Architecture
* **Hypervisor:** VMware Workstation Pro
* **Operating System:** Windows Server 2022 Standard
* **Core Services:** Active Directory Domain Services (AD DS), DNS, DHCP
* **Network Segment:** Internal LAN (Routed and filtered via pfSense)

## Key Configurations & IAM Controls
* **Domain Architecture:** Designed and provisioned a local forest and domain structure to simulate a corporate environment.
* **Role-Based Access Control (RBAC):** Configured logical Organizational Units (OUs), security groups, and delegated permissions to enforce the principle of least privilege.
* **Group Policy Management:** Implemented custom GPOs to harden endpoint security, enforce complex password policies, and restrict unauthorized administrative access.
* **Advanced Audit Policy:** Configured detailed Windows Event logging (including Account Logon, Privilege Use, and Object Access) to ensure comprehensive visibility into identity-based anomalies.

## SIEM Integration (Wazuh)
This Active Directory environment is being actively integrated with the homelab's Wazuh SIEM deployment. 
* **Current Status:** Preparing the deployment of the Wazuh agent and Sysmon to forward critical Event IDs (e.g., 4624, 4625, 4720) to the central manager for real-time alerting on brute-force attempts and unauthorized account creations.

## Repository Structure
```text
├── gpo-backups/
│   └── (Planned) baseline-security-policy.html
├── scripts/
│   └── (Planned) bulk-user-provisioning.ps1
└── README.md
```
## Ongoing Objectives
- [ ] Document the step-by-step promotion of the Windows Server to a Domain Controller.
- [ ] Export and upload HTML reports of the applied security Group Policy Objects.
- [x] Write and test PowerShell scripts for automated user onboarding and offboarding.
- [ ] Successfully validate the ingestion of Windows Security Event logs into the Wazuh dashboard.
