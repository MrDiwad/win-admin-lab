# windows-admin-lab

Main goal of this project is to learn by practice how to administer Windows-based environments.

# Technologies to learn:

- Windows Server administration
- Windows client administration
- networking and troubleshooting
- remote administration
- Active Directory and DNS
- DHCP
- users, groups and permissions
- PowerShell
- processes and services
- Windows logs and monitoring
- Windows Firewall and security
- Group Policy
- automation
- backup and recovery

# Environment

- Windows 11 host
- Windows Server 2025 Standard Evaluation - Desktop Experience guest (`DC01`)
- Windows 11 Enterprise guest (`WIN11-01`)
- Oracle VirtualBox
- Isolated VirtualBox Internal Network: `win-admin-lab`
- `DC01`: 4096 MB RAM, 2 CPU, 50 GB dynamically allocated disk
- `DC01` IPv4 address: `10.0.0.1/24`
- `WIN11-01` IPv4 address: `10.0.0.10/24`
- Gateway on `DC01`: none — intentionally isolated from the Internet
- DNS on `DC01`: `10.0.0.1`
- Planned lab domain: `corp.test`

# Lab architecture

```text
                      Windows Server
                           DC01
                    10.0.0.1/24
                           │
                 Internal Network
                   win-admin-lab
                           │
                    WIN11-01
                  10.0.0.10/24
                      Windows client
```

The laboratory network is isolated from the home network. This is especially important before configuring DHCP, so that the lab cannot distribute addresses to real devices.

# Progress

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

#dsa.msc view
<img width="1330" height="1016" alt="image" src="https://github.com/user-attachments/assets/aed5a02f-130e-4e50-b07c-db76307fc792" />

#dhcp panel view
<img width="1548" height="840" alt="image" src="https://github.com/user-attachments/assets/a19647a9-6070-422b-93b0-f794b402ba4c" />

#view on shared disk from kzielinski (worker from HR)
<img width="2026" height="1174" alt="image" src="https://github.com/user-attachments/assets/6e58bc6a-a1a0-40bf-ae56-77957a060821" />
