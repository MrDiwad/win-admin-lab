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

### Task 12 — Active Directory Organizational Units (OUs)

- `Get-ADOrganizationalUnit -Filter *` — Query all Organizational Units in the domain.
- `New-ADOrganizationalUnit -Name "<Name>" -Path "<DN>"` — Create a new OU at a specific LDAP path (Distinguished Name).
- `dsa.msc` — Open the "Active Directory Users and Computers" GUI management console.
- Distinguished Name (DN) — Unique LDAP path of an object (e.g., `OU=Finance,DC=corp,DC=test`).
- Organizational Unit (OU) vs Group — OUs are logical containers used for GPO linking and administrative delegation; Groups are security principals used for resource permissions.

### Task 13 — Active Directory Domain Users

- `New-ADUser` — Create a new domain user account with specified attributes (Name, SamAccountName, UPN, Path).
- `Get-ADUser -Filter *` — Query domain users (use `-Properties *` to see all extended attributes).
- `Set-ADUser` — Modify attributes of an existing domain user account.
- `Disable-ADAccount` / `Enable-ADAccount` — Disable or enable a user account.
- `Unlock-ADAccount` — Unlock a user account locked due to failed password attempts.
- `ConvertTo-SecureString "<Pass>" -AsPlainText -Force` — Convert plaintext password into an encrypted SecureString object for PowerShell.

- ### Task 14 — Active Directory Domain Groups

- `New-ADGroup` — Create a new domain group (specifying `-GroupScope Global` and `-GroupCategory Security`).
- `Add-ADGroupMember -Identity "<Group>" -Members "<User>"` — Add one or more members to an AD group.
- `Get-ADGroupMember -Identity "<Group>"` — List all members of a specific AD group.
- `Get-ADPrincipalGroupMembership -Identity "<User>"` — List all groups a user belongs to.
- Security Group vs Distribution Group — Security groups have a SID and grant access to resources; Distribution groups are used only for email distribution lists.

### Task 15 — Windows File Server and SMB Sharing

- `New-SmbShare -Name "<Share>" -Path "<Path>" -FullAccess "<Group>"` — Create a new network share over SMB protocol.
- `Get-SmbShare` — List all SMB shares on the machine (both public and hidden administrative shares).
- `Remove-SmbShare -Name "<Share>"` — Stop sharing a folder and delete the SMB share.
- UNC Path (Universal Naming Convention) — Network addressing syntax: `\\ServerName\ShareName`.
- Hidden / Administrative Shares (`$`) — Shares ending with `$` (e.g., `C$`, `ADMIN$`) are invisible during network browsing.
- SMB Port — TCP port 445.

- ### Task 16 — NTFS Permissions vs Share Permissions

- Share Permissions — Network-level access gate for SMB shares; offers Read, Change, and Full Control.
- NTFS Permissions (ACLs) — File system-level security applied locally and over the network; granular permissions (Read, Write, Modify, Full Control).
- Most Restrictive Wins — Rule stating that the effective permission over the network is the most restrictive combination of Share and NTFS permissions.
- `icacls "<Path>" /inheritance:d` — Disables inheritance and copies inherited permissions as explicit access control entries (Convert).
- `icacls "<Path>" /remove "<Identity>"` — Removes an identity (user or group) from the NTFS access control list.
- `icacls "<Path>" /grant "<Identity>":(OI)(CI)M` — Grants Modify permissions with Object Inherit (files) and Container Inherit (subfolders).
- `net use Z: \\Server\Share /user:Domain\User` — Maps a network share to drive letter Z: using specific domain user credentials.
- `net use * /delete /y` — Disconnects and purges all active SMB network connections.

- ### Task 17 — Group Policy (GPO): Architecture and Fundamentals

- GPO (Group Policy Object) — Centralized configuration management framework for Active Directory environments.
- LSDOU Processing Order — Local -> Site -> Domain -> OU. The last applied policy wins in case of conflicts (OU overrides Domain).
- Computer Configuration — Applied at system boot; targets the computer account regardless of logged-in user.
- User Configuration — Applied at user logon; targets the user account across any domain workstation.
- SYSVOL Share — Special domain-wide shared folder (`\\Domain\SYSVOL`) storing GPO templates and scripts, replicated via DFS-R.
- `gpmc.msc` — Group Policy Management Console; primary administrative tool for managing GPOs and links.
- `Get-GPO -All` — PowerShell cmdlet to retrieve all GPOs within the domain.
- `gpupdate /force` — Forces an immediate refresh of all computer and user policies instead of waiting for the 90-minute cycle.
- `gpresult /r` — Displays an RSoP (Resultant Set of Policy) summary showing which GPOs were actually applied.

- ### Task 18 — Group Policy: Practical Deployment and Troubleshooting

- GPO Creation & Linking — A GPO must be created in 'Group Policy Objects' and explicitly linked to a Domain or OU to take effect.
- Interactive Logon Policy — Security settings (`Interactive logon: Message title/text`) defining legally required pre-login warning banners.
- Registry Backing (`HKLM`) — Computer Configuration GPOs physically write their enforcement values to `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies`.
- Domain Membership Requirement — GPOs are only evaluated and applied by domain-joined computer and user accounts (Workgroup machines ignore AD GPOs).
- Full Logon vs Session Unlock — Logon banners require a full sign-out and sign-in cycle to display, rather than a workstation unlock.

- ### Task 19 — Domain Joining and Workstation Management

- `Resolve-DnsName <Domain>` — Verifies DNS resolution of the AD domain controller from client workstations.
- `Add-Computer -DomainName "<Domain>" -Credential (Get-Credential) -Restart` — Joins a client workstation to an Active Directory domain and restarts the machine.
- `sysdm.cpl` — Classic System Properties GUI applet to modify computer name and domain membership.
- Default `CN=Computers` Container — Default landing container for newly joined computer accounts; cannot have GPOs directly linked to it.
- `Move-ADObject` / Drag-and-drop in `dsa.msc` — Moving computer accounts into designated Organizational Units (e.g., `OU=Workstations`) for proper GPO application.
- Domain User Profile — Local profile created on the client machine upon first logon of a domain user (`corp\username`).

- ### Task 20 — Administrative Delegation and Principle of Least Privilege (RBAC)

- Principle of Least Privilege — Security concept where users/identities receive only the minimum permissions required to perform their jobs.
- Delegation of Control Wizard — Built-in GUI tool in `dsa.msc` to delegate specific administrative rights (e.g., password reset) on target OUs without granting Domain Admin rights.
- Active Directory Tiering Model — Security architecture separating administrative boundaries: Tier 0 (Domain Controllers/Admins), Tier 1 (Servers/Apps), Tier 2 (Workstations/Helpdesk).
- RSAT (Remote Server Administration Tools) — Client-side toolset allowing Helpdesk technicians to manage AD remotely from their Windows workstations.
- Protected Users / Groups — High-privileged domain accounts protected from delegated credential changes by `AdminSDHolder`.

- ### Task 21 — Dynamic Host Configuration Protocol (DHCP) Server

- DORA Process — Four-step DHCP negotiation: Discover (client broadcast) -> Offer (server response) -> Request (client acceptance) -> Acknowledge (server confirmation).
- DHCP Authorization — AD DS security feature requiring DHCP servers to be authorized in Active Directory before servicing clients.
- DHCP Scope — Defined pool of IP addresses allocated for lease on a specific subnet.
- Option 006 (DNS Servers) — DHCP option delivering the IP addresses of DNS servers (crucial for AD domain resolution).
- DHCP Lease Time — Duration for which a client can use an assigned IP address before renewing or releasing it back to the pool.
- DHCP Reservation — Binding a specific IP address to a client's MAC address so it always receives the same IP dynamically.
- `dhcpmgmt.msc` — Microsoft Management Console snap-in for managing Windows DHCP Server.
