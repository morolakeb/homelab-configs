# Enterprise Homelab Configurations

## Overview
This repository serves as a centralized backup and version control system for my local enterprise cybersecurity homelab. It contains configuration files, deployment scripts, and operational documentation. 

The primary purpose of this lab is to simulate real-world enterprise environments, practice threat detection, and maintain hands-on experience with technical security engineering and systems administration.

## Core Infrastructure
*   **Network Perimeter / Firewall:** pfSense
*   **SIEM / Threat Detection:** Wazuh 
*   **Systems / Endpoints:** Red Hat Enterprise Linux (RHEL), Windows Server

## Repository Structure
*   `/pfsense` - Firewall rules, NAT configurations, and interface backups.
*   `/wazuh` - Custom decoders, rulesets, and agent configurations.
*   `/rhel` - Bash scripts, automation, and RHCSA preparation labs.
*   `/windows-server` - Active Directory policies and event logging configs.

## Current Objectives
*   Maintain strict version control over all infrastructure changes.
*   Document technical troubleshooting steps and continuous improvements.
*   Develop and test custom security alerts within the SIEM environment.