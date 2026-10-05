# Windows Admin Lab — Notes

Short command and configuration notes from the completed parts of the lab.

## Commands

- `ipconfig` — displays the basic IP configuration
- `ipconfig /all` — displays the full IP configuration, including DNS and adapter details
- `ping 10.0.0.1` — tests connectivity from `WIN11-01` to `DC01`
- `arp -a` — displays the ARP table and helps confirm local network visibility
- `ping google.com` — tests name resolution in the isolated lab; final result was not recorded

- ### Task 4 — PowerShell: Administration Basics

- `systeminfo` — Display detailed system configuration (legacy CLI text output).
- `Get-ComputerInfo` — Get comprehensive system configuration object.
- `Select-Object` (alias: `select`) — Select specific object properties or limit output count (`-First`).
- `Format-List` (alias: `fl`) — Format output as a vertical key-value list (prevents truncation).
- `Get-Service` (alias: `gsv`) — Retrieve system services and their status.
- `Where-Object` (alias: `where`, `?`) — Filter pipeline objects based on property values (`-eq`, `-ne`, `-like`).
- `Measure-Object` — Count or calculate objects in pipeline (PowerShell equivalent of `wc -l`).
- `Get-Process` (alias: `ps`, `gps`) — Retrieve active processes.
- `Sort-Object` (alias: `sort`) — Sort objects by property (`-Descending`).
- `Get-LocalUser` — List local user accounts and account status (`Enabled`).
- `Get-LocalGroupMember` — List members of a local security group.
- `New-Item` — Create a file (`-ItemType File`) or directory (`-ItemType Directory`).
- `Rename-Computer` — Change the computer hostname (requires reboot).
- `Restart-Computer` — Reboot the system from the console.
- `hostname` / `$env:COMPUTERNAME` — Return the current machine name.

### Task 5 — Process and Service Management

- `Start-Service` — Start a stopped service.
- `Stop-Service` — Stop a running service.
- `Restart-Service` — Restart a running service.
- `Set-Service` — Configure service startup type (`-StartupType Automatic|Manual|Disabled`).
- `(Get-Service <Name>).DependentServices` — List services that depend on this service.
- `(Get-Service <Name>).ServicesDependedOn` — List prerequisites required by this service.
- `Start-Process` — Launch a process/application in the background.
- `Stop-Process` (alias: `kill`) — Terminate a running process by ID (`-Id`) or name (`-Name`).

- ### Task 6 — Event Viewer and Windows Logs

- `Get-EventLog` — Retrieve events from classic event logs (System, Application).
- `Get-WinEvent` — Modern, high-performance cmdlet for querying all Windows event logs.
- `Get-WinEvent -LogName <Name> -MaxEvents <N>` — Fetch the latest N events from a specific log.
- `Get-WinEvent -FilterHashtable @{LogName='<Log>'; Id=<ID>}` — Query events filtered at the source (fastest method).
- Event ID `4624` — Successful account logon (Security log).
- Event ID `4625` — Failed account logon attempt (Security log).

- ### Task 7 — Windows Firewall Administration

- `Get-NetFirewallProfile` — View status and default actions for Domain, Private, and Public profiles.
- `Get-NetConnectionProfile` — Check network category (Public, Private, Domain) assigned to active NICs.
- `Get-NetFirewallRule` — List and inspect firewall rules.
- `Enable-NetFirewallRule` — Enable a disabled firewall rule.
- `Disable-NetFirewallRule` — Disable an active firewall rule without deleting it.
- `New-NetFirewallRule` — Create a new inbound/outbound firewall rule.
- `Remove-NetFirewallRule` — Permanently delete a firewall rule.
- `Test-NetConnection` (alias: `tnc`) — Test network connectivity, ICMP ping, and specific TCP ports.

### Task 8 — Windows Server Roles and Features

- `Get-WindowsFeature` — List all available and installed roles and features (`[X]` = Installed, `[ ]` = Available).
- `Get-WindowsFeature | Where-Object Installed` — Filter and display only currently installed components.
- `Install-WindowsFeature` (alias: `Add-WindowsFeature`) — Install a specified role or feature.
- `-IncludeManagementTools` — Parameter to include GUI consoles and PowerShell modules for managing the role.
- `-WhatIf` — Simulate execution without making any actual changes to the system.
- `Uninstall-WindowsFeature` (alias: `Remove-WindowsFeature`) — Remove an installed role or feature.

- ### Task 9 — Installing Active Directory Domain Services (AD DS)

- `Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools` — Install the AD DS server role and RSAT management tools.
- `Get-Module -ListAvailable ActiveDirectory` — Verify installation of the Active Directory PowerShell module.
- Domain Controller (DC) — Server hosting the AD DS directory database.
- Forest / Domain — Logical hierarchy boundaries for centralized authentication (e.g., `corp.test`).
- `ntds.dit` — Physical database file storing all directory objects (users, groups, machines).

- ### Task 10 — Promoting Server to Domain Controller

- `Install-ADDSForest -DomainName "<Domain>"` — Promote server to the first Domain Controller in a new Active Directory forest.
- `whoami` — Verify current security context (transitions from `DC01\User` to `DOMAIN\User`).
- `Get-ADDomain` — View Active Directory domain details, partitions, and domain modes.
- `Get-ADDomainController` — Inspect the local Domain Controller configuration, roles, and status.
- DSRM (Directory Services Restore Mode) — Safe mode recovery password used for offline AD database repairs.

### Task 11 — Active Directory DNS Infrastructure

- `Get-DnsServerZone` — List all forward and reverse lookup zones on the DNS server.
- `Get-DnsServerResourceRecord` — Query and view DNS records within a zone.
- `Resolve-DnsName` — PowerShell cmdlet to query DNS servers (modern replacement for `nslookup` / `dig`).
- Active Directory-Integrated DNS (`IsDsIntegrated: True`) — DNS records stored in `ntds.dit` with multi-master replication and secure dynamic updates.
- SRV Records (Service Location) — Special DNS records used by clients to locate Domain Controllers and services (e.g., LDAP on 389, Kerberos on 88).
