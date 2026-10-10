# Windows-Admin-Lab

The main goal of this project is to learn and demonstrate practical system administration and infrastructure management in a Windows-based enterprise environment.

# Technologies covered:

- Windows Server 2025 administration
- Windows 11 Enterprise client administration
- Core networking & layered troubleshooting (OSI)
- Remote administration (RDP, PowerShell)
- Active Directory Domain Services (AD DS) & Integrated DNS
- Dynamic Host Configuration Protocol (DHCP) & DORA process
- Role-Based Access Control (RBAC) & NTFS vs Share permissions
- Advanced PowerShell scripting & automation
- Process and service management
- Windows Event Logs & security auditing (Security Log, Event IDs)
- Windows Defender Firewall hardening
- Group Policy Objects (GPO architecture, LSDOU, Drive Maps, Security Banners)
- Task Scheduler automation under service accounts
- Backup, Disaster Recovery & Active Directory Recycle Bin

# Environment & Specifications

- **Host:** Windows 11
- **Domain Controller (`DC01`):** Windows Server 2025 Standard Evaluation (Desktop Experience)
  - Resources: 4096 MB RAM, 2 vCPU, 50 GB dynamic disk
  - IPv4: `10.0.0.1/24` (Static)
  - DNS: `10.0.0.1` (Self)
  - Gateway: None (Intentionally isolated)
  - Forest / Domain: `corp.test`
- **Workstation Client (`WIN11-01`):** Windows 11 Enterprise
  - IPv4: Initially static `10.0.0.10/24`, later dynamic DHCP lease (`10.0.0.100`)
  - DNS: `10.0.0.1` (Provided via DHCP Option 006)
  - Domain Status: Joined to `corp.test` (`OU=Workstations`)
- **Virtualization:** Oracle VirtualBox
- **Network Mode:** Isolated Internal Network (`win-admin-lab`)

# Lab architecture

```text
                      Windows Server 2025
                           DC01
                    10.0.0.1/24 (Static)
                   [AD DS, DNS, DHCP, SMB]
                           │
                 Internal Network (Isolated)
                   win-admin-lab
                           │
                    WIN11-01
                  10.0.0.100/24 (DHCP)
                Windows 11 Client (Joined)

```
The laboratory network is isolated from the home network. This is especially important before configuring DHCP, so that the lab cannot distribute addresses to real devices.

# Milestones

- [x] Launching Windows Server VM
- [x] Installing Windows Server 2025
- [x] Creating the isolated VirtualBox network
- [x] Preparing `DC01` for administration
- [x] Configuring IPv4 addressing
- [x] Understanding subnet mask, gateway and DNS
- [x] Testing connectivity between `DC01` and `WIN11-01`
- [x] Troubleshooting ping and ICMP through Windows Firewall
- [x] Configuring remote administration with RDP
- [x] Connecting from `WIN11-01` to `DC01` using RDP
- [x] Troubleshooting RDP and firewall configuration
- [x] PowerShell basics for administrators 
- [x] Process management and monitoring
- [x] Windows services
- [x] Event Viewer and Windows logs
- [x] Windows Firewall administration
- [x] Roles and Features
- [x] Installing Active Directory Domain Services
- [x] Promoting `DC01` to a Domain Controller
- [x] DNS in Active Directory
- [x] Organizational Units
- [x] Domain users and groups
- [x] File Server configuration
- [x] NTFS permissions and Share permissions
- [x] Group Policy basics
- [x] Practical Group Policy deployment
- [x] Joining `WIN11-01` to the domain
- [x] Delegating administration and least privilege
- [x] DHCP configuration
- [x] PowerShell automation and Task Scheduler
- [x] Backup and recovery
- [x] Final troubleshooting scenarios
- [x] Final company environment project

# Learning approach

This project follows a practical, task-based learning approach.

- Each task has a clear goal and completion condition.
- The first attempt is made independently.
- Commands are not provided immediately unless help is needed.
- Troubleshooting starts with collecting information and narrowing down the cause.
- Every change is verified after it is made.
- Important results, problems and solutions are documented.

# Key implementation highlights
- **Role-Based Access Control (RBAC):** Department isolation (IT, Finance, Management, HR) strictly enforced via NTFS ACLs and Active Directory Global Security Groups.
- **Principle of Least Privilege:** Helpdesk delegation configured on target OUs without exposing Domain Admin privileges.
- **Automated Configuration via GPO:** Automated network drive mapping (`Z:`) and corporate interactive logon banners deployed through Group Policy.
- **Business Continuity:** Active Directory Recycle Bin enabled for instant object recovery, automated Task Scheduler audits, and hardened DHCP authorization.

# Active Directory Users & Computers (dsa.msc)
<img width="1330" height="1016" alt="image" src="https://github.com/user-attachments/assets/aed5a02f-130e-4e50-b07c-db76307fc792" />

# DHCP Server Management (dhcpmgmt.msc)
<img width="1548" height="840" alt="image" src="https://github.com/user-attachments/assets/a19647a9-6070-422b-93b0-f794b402ba4c" />

# Mapped Network Drive from Client (kzielinski - HR Department)
<img width="2026" height="1174" alt="image" src="https://github.com/user-attachments/assets/6e58bc6a-a1a0-40bf-ae56-77957a060821" />
