# Multi-Cloud Honeypot & Threat Analysis

> 🚧 **Status: Active Redeployment Planning**
> *This environment is being spun back up to capture fresh attack telemetry, export live Kusto Query Language (KQL) threat hunting queries, and generate updated dashboard visualizations.*

## Overview
This directory documents the architecture, deployment, and analytical findings of a multi-cloud honeypot environment. 

The primary objective of this project is to deploy intentionally vulnerable infrastructure to the public internet, aggregate the resulting attack telemetry, and practice live threat hunting. This project serves as a practical application of tracking complex, anomalous behaviors—translating an investigative mindset into technical cloud security.

## Environment Architecture
* **Cloud Providers:** Amazon Web Services (AWS), Microsoft Azure
* **SIEM / Log Aggregation:** Microsoft Sentinel
* **Log Sources:** Windows Security Events, Linux Syslog, Network Security Group (NSG) Flow Logs

## Key Engineering Phases
### 1. Infrastructure Deployment
* Provision virtual machines in both Azure and AWS.
* Configure firewalls and Network Security Groups to expose specific ports (e.g., RDP, SSH) to the public internet to attract opportunistic scanning and brute-force attempts.

### 2. SIEM Integration
* Deploy a Log Analytics Workspace in Azure.
* Configure data collection rules to securely funnel event logs and network traffic data from both cloud providers directly into Microsoft Sentinel.

### 3. Log Analysis & Threat Hunting
* Monitor live Sentinel workbooks to visualize global attack origins.
* Query Kusto Query Language (KQL) to extract specific threat indicators, track repeated brute-force patterns, and analyze the most frequently targeted usernames and protocols.

## Repository Structure
```text
├── queries/
│   └── (Planned) sentinel-kql-queries.txt
├── dashboards/
│   └── (Planned) global-attack-map.png
└── README.md
```
## Ongoing Objectives
[ ] Provision the vulnerable AWS and Azure virtual machines.

[ ] Successfully connect both environments to the Azure Log Analytics Workspace.

[ ] Export custom KQL queries used to identify the top 10 attacking IP addresses.

[ ] Capture and upload screenshots of the Sentinel visual attack map.
