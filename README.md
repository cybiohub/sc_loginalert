| ![alt text][logo] | Integration & Securite Systeme |
| ------------- |:-------------:|

# Cybionet - Ugly Codes Division

## SUMMARY

This script sends an email in HTML format at each authentication for one or several specific user.


You can apply the launch of this script for each of the PAM modules.

Recommended:
 - sshd
 - su
 - sudo

<br>

### Screenshot

Example of an email alert with an authorized IP address.

![Email Alert Authorized](./md/LASSHOK.png "Email Alert Authorized for SSH")
![Email Alert Authorized](./md/LASUOK.png "Email Alert Authorized for SU")
![Email Alert Authorized](./md/LASUDOOK.png "Email Alert Authorized for SUDO")

Example of an email alert with an unauthorized IP address.

![Email Alert Unauthorized](./md/LASSHNOK.png "Email Alert Unauthorized for SSH")

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

---
[logo]: ./md/logo.png "Cybionet"
