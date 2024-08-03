![alt text][logo]

# Cybionet - Ugly Codes Division

## SUMMARY

This script sends an email in HTML format at each authentication for one or several specific users.

You can apply the launch of this script for each of the PAM modules.

Recommended:
 - sshd
 - su
 - sudo


<br>

## REQUIRED

The `loginalert` application requires the following additional packages to work.

 Use `apt-get` command to install these dependencies.
 - mutt
 - whois
 - gpgsm


<br>

## INSTALLATION

[Installation and Configuration](INSTALL.md) 


<br>

## SCREENSHOT

Example of an email alert with an authorized IP address.

> [!TIP]
> - Send alerts to one or more email addresses simultaneously.
> - Create exclusions for your legitimate IP addresses or IP address range.
> - Create exclusions for certain users, for example those used by Ansible scripts.
> - Easily customize the message with your own logo.

<br>

![Email Alert Authorized](./md/LASSHOK.png "Email Alert Authorized for SSH")
![Email Alert Authorized](./md/LASUOK.png "Email Alert Authorized for SU")
![Email Alert Authorized](./md/LASUDOOK.png "Email Alert Authorized for SUDO")

Example of an email alert with an unauthorized IP address.

![Email Alert Unauthorized](./md/LASSHNOK.png "Email Alert Unauthorized for SSH")

---
[logo]: ./md/logo.png "Cybionet"
