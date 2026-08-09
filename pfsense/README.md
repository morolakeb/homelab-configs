# pfSense Firewall Configuration & Backup Repository

## Overview
This repository serves as a centralized backup and version control system for my local pfSense firewall deployment. Operating as the primary gateway for a custom enterprise homelab running on VMware Workstation Pro, this pfSense instance handles internal network routing, segmentation, and perimeter defense. 

By tracking the XML configuration backups here, I ensure business continuity for my lab environment, maintain a reliable disaster recovery point, and document the evolution of my network's security posture.

## Environment Architecture
- **Hypervisor:** VMware Workstation Pro
- **Firewall/Router:** pfSense (Virtual Appliance)
- **Downstream Instances:** Windows Server 2022 (Active Directory), Linux distributions (RHEL, AlmaLinux)

## Key Configurations Documented
- **Interface Assignments:** Strict WAN/LAN segmentation to isolate homelab traffic.
- **Firewall Rules:** Ingress and egress filtering policies to control inter-VLAN and outbound traffic.
- **DHCP & DNS Services:** Local addressing and resolution for enterprise homelab nodes.
- **NAT Configuration:** Outbound NAT rules for secure external communication.

## Repository Structure
```text
├── configs/
│   ├── initial-setup-backup.xml
│   └── current-config-backup.xml
├── docs/
│   └── network-topology-notes.md
└── README.md
