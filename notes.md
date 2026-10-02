# Windows Admin Lab — Notes

Short command and configuration notes from the completed parts of the lab.

## Commands

- `ipconfig` — displays the basic IP configuration
- `ipconfig /all` — displays the full IP configuration, including DNS and adapter details
- `ping 10.0.0.1` — tests connectivity from `WIN11-01` to `DC01`
- `arp -a` — displays the ARP table and helps confirm local network visibility
- `ping google.com` — tests name resolution in the isolated lab; final result was not recorded

## Network troubleshooting

- Ping timeout — does not automatically mean that the IP configuration is wrong
- `arp -a` shows the host — the machines can see each other at the local network level
- ICMP Echo Request — must be allowed through the firewall for ping to work
- Windows Firewall — check it before changing IP addresses or VirtualBox settings

## RDP / remote administration

- Remote Desktop — enabled on `DC01`
- RDP connection — `WIN11-01` connected successfully to `DC01`
- Firewall profiles — checked Domain, Private and Public profiles
- `Action = Allow` — the rule allows matching traffic when active
- `Enabled = No` — the rule is currently inactive
- `Remote Desktop` — refers to RDP and graphical remote access
- `OpenSSH` — refers to SSH and is not the same as RDP
