## About:
* Title: sudoSnatch
* Description: sudoSnatch grabs plain text passwords remotely/locally.
* AUTHOR: drapl0n
* Version: 1.0
* Category: Credentials
* Target: Unix-like operating systems with systemd.

## sudoSnatch: sudoSnatch payload grabs sudo password in plain text, imediately after target uses `sudo` command and sends it back to attacker remotely/locally.

### Features:
* Plain text passwords.
* Detailed password logs.
* Persistent
* Autostart payload on boot.

### Workflow:
* Injecting payload on target's system.
* Checks whether internet is connected to the target system. 
* If internet is connected then it sends clear text passwords to attacker. 

### Changes to be made in payload.sh:
* Replace ip(0.0.0.0) and port number(4444) with your servers ip address and port number on line `32`.
* Increase/Decrease time interval to restart service periodically (Default is 15 mins) on line `48`.

### Usage:
1. Inject payload into target's system.
2. Start netcat listner on attacking system:

* `nc -l -p <port number>` use this command to fetch passwords.

#### Support me if you like my work:
* https://twitter.com/drapl0n 
