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
```
## 🚧 Active Rebuild & Troubleshooting Log

As part of continuous improvement, I am currently re-architecting this Wazuh deployment to resolve initial deployment instabilities and establish a cleaner baseline for endpoint logging. 

### Phase 1: Teardown & Environment Prep
* **Status:** In Progress
* **Objective:** Completely remove the legacy Wazuh installation and provision a clean virtual environment.
* **Notes:** *(Add a brief note here about how you removed the old instance, e.g., "Deleted old VM instance in VMware Workstation and allocated 8GB RAM/4 vCPUs for the new centralized manager.")*

### Phase 2: Manager & Indexer Deployment
* **Status:** Pending
* **Objective:** Install the Wazuh central manager and verify web interface connectivity.
* **Challenges Anticipated/Resolved:** *(Leave this blank for now, and fill it in if you hit a snag during the installation!)*

### Phase 3: Agent Authentication & Connectivity
* **Status:** Pending
* **Objective:** Deploy Wazuh agents to the Windows Server 2022 and Linux instances and ensure logs are successfully reaching the SIEM.
* **Notes:** *(Document any firewall rules you had to adjust in pfSense to allow the agents to communicate with the manager.)*
