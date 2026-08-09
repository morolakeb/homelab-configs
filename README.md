# Enterprise Homelab Configurations

## Overview
This repository serves as a centralized backup and version control system for my local enterprise cybersecurity homelab. It contains configuration files, deployment scripts, and operational documentation.

The primary purpose of this lab is to simulate real-world enterprise environments, practice threat detection, and maintain hands-on experience with technical security engineering and systems administration.

## Core Infrastructure
- **Hypervisor:** VMware Workstation Pro
- **Network Perimeter / Firewall:** pfSense
- **SIEM / Threat Detection:** Wazuh
- **Systems / Endpoints:** Windows Server 2022 (Active Directory), Red Hat Enterprise Linux (RHEL), AlmaLinux

## Repository Directory
Click into the folders below to view the specific deployment notes, architecture details, and configuration backups for each tool:

*   📁 **[/pfsense](./pfsense)** - Firewall rules, NAT configurations, interface backups, and network segmentation.
*   📁 **[/wazuh](./wazuh)** - SIEM deployment notes, custom decoders, and agent configurations *(Currently undergoing an active architectural rebuild)*.
*   📁 **[/rhel](./rhel)** - Bash scripts, automation, and practical labs for RHCSA exam preparation.
*   📁 **[/windows-server](./windows-server)** - Active Directory policies and event logging configurations.
*   📁 **[/multi-cloud-honeypot](./multi-cloud-honeypot)** - Vulnerable infrastructure deployment across AWS and Azure, Microsoft Sentinel SIEM integration, and live threat hunting.

## Current Objectives
- Maintain strict version control over all infrastructure changes.
- Document technical troubleshooting steps and continuous improvements.
- Develop and test custom security alerts within the SIEM environment.
