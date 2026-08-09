# Linux Infrastructure & RHCSA Automation

## Overview
This directory contains the configuration files, Bash scripts, and operational documentation for the Red Hat Enterprise Linux (RHEL) and AlmaLinux instances within my enterprise homelab. 

These systems serve a dual purpose: simulating enterprise Linux endpoints for SIEM log ingestion (Wazuh) and providing a dedicated environment for advanced system administration practice, security hardening, and hands-on preparation for the Red Hat Certified System Administrator (RHCSA) certification.

## Environment Architecture
* **Hypervisor:** VMware Workstation Pro
* **Operating Systems:** Red Hat Enterprise Linux (RHEL), AlmaLinux
* **Network Segment:** Internal LAN (Routed via pfSense)
* **SIEM Integration:** Monitored via Wazuh agents (Syslog, file integrity monitoring, SSH access logs)

## Key Configurations & Administration
* **User & Group Management:** Configuring local users, managing group policies, and enforcing secure password aging parameters.
* **File Permissions & ACLs:** Managing standard file permissions, Access Control Lists (ACLs), and exploring SELinux contexts for enhanced access restrictions.
* **Storage & File Systems:** Creating and managing physical volumes, volume groups, and logical volumes using LVM.
* **Security & Firewalling:** Hardening SSH configurations (key-based authentication, disabling root login) and managing port access via `firewalld`.

## Repository Structure
```text
├── scripts/
│   └── (Planned) backup-automation.sh
├── configs/
│   └── (Planned) sshd_config_baseline
└── README.md
```
📚 RHCSA Study & Automation Objectives
[ ] Write and execute a Bash script to automate local user provisioning and permission assignment.

[ ] Document the process of configuring and expanding Logical Volumes (LVM) without downtime.

[ ] Create a custom firewalld zone and configure strict ingress rules for homelab services.

[ ] Analyze SELinux logs to identify and resolve permission denials for a custom service.
