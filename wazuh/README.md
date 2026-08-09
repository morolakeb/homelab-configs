# Wazuh SIEM Deployment & Configuration

> 🚧 **Status: Active Rebuild in Progress**
> *This environment is currently being re-architected from the ground up to resolve previous deployment instabilities, establish a cleaner baseline, and implement more advanced endpoint logging.*

## Overview
This directory contains the configurations, custom decoders, and deployment notes for the Wazuh Security Information and Event Management (SIEM) instance within my enterprise homelab. 

Acting as the core visibility engine of the network, this Wazuh deployment is being engineered to collect, aggregate, and analyze security events across multiple operating systems. The goal is to simulate a real-world Security Operations Center (SOC) environment for continuous threat hunting and incident response practice.

## Monitored Infrastructure (Planned)
Once the central manager is fully stabilized, Wazuh agents will be deployed to monitor the following homelab endpoints:
*   **Windows Server 2022:** Monitoring Active Directory logs, authentication events, and privilege escalations.
*   **Linux Distributions (RHEL & AlmaLinux):** Tracking file integrity, SSH access, and syslogs.
*   **pfSense Firewall:** Ingesting perimeter traffic logs and firewall drop events.

## Current Objectives
- [ ] **Infrastructure Teardown & Baseline:** Clean up remnants of the legacy installation and provision a fresh virtual environment.
- [ ] **Manager Deployment:** Install and configure the Wazuh central manager and indexer.
- [ ] **Agent Rollout:** Deploy and authenticate agents across Windows and RHEL endpoints.
- [ ] **Custom Rulesets:** Develop custom rules to detect specific anomalies, such as multiple failed login attempts and unauthorized configuration changes.

## Engineering Notes & Troubleshooting
*(This section will be updated with technical challenges encountered during the rebuild and the steps taken to resolve them, demonstrating practical problem-solving workflows.)*

## Repository Structure
```text
├── decoders/
│   └── (Planned) custom-decoders.xml
├── rules/
│   └── (Planned) custom-alerts.xml
└── README.md
