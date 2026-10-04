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
