| ![alt text][logo] | Integration & Securite Systeme |
| ------------- |:-------------:|

# Installation of the Loginalert script.

Install this script on the machine where you want to be alerted when a user logs on. It will send an email in HTML format for each authentication (login, ssh, su and sudo).

In the script, we use the "Mutt" application to send the warning email.

## Requirement

 Use "apt-get" command to install these dependencies.
 - mutt
 - whois
 - gpgsm


## Deployment

1. Deploy the executable of the "loginalert" script.

```bash
cp ./bin/loginalert /usr/bin/

chown root:root /usr/bin/loginalert
chmod 500 /usr/bin/loginalert
```

2. Add the following entry to the files in the pam.d directory. You should do this at a minimum for "sshd", but we recommend that you also add the line in the "login", "su" and "sudo" files.

```bash
vim /etc/pam.d/sshd
vim /etc/pam.d/login
vim /etc/pam.d/su
vim /etc/pam.d/sudo
```

and add this line to the end of the last "session" parameters in the file.

```
session optional pam_exec.so /usr/bin/loginalert
```


## Configuration

Adjust these variables in the script to match your reality.

1. Configure the recipient's email address.

For a single recipient (TO).

```
emailTo='user@example.com'
```

For a several recipients (TO). The delimiter is the comma and spaces don't matter.

```
emailTo='user1@example.com, user2@example.com'
```

2. Configure the sender's email address.

Defined sender (FROM).

```
emailFrom='alert@example.com'
```

3. Configure this variable to allow one or more IP addresses or you can allow one or more subnets.

For an unique IP.

```
ALLOWIP='192.168.0.11'
```

To add multiple IP addresses. Each of them must be separated by a space.

```
ALLOWIP='192.168.0.11 172.16.1.10'
```

For an IP address range.

```
ALLOWIP='192.168.0'
```

For multiple IP address ranges. Each range of IP addresses must be separated by space.

```
ALLOWIP='192.168.0 172.16.0'
```


## Custom logo header

Supported image formats: jpeg, png et svg.
Maximum size: 312 x 56

1. Convert your header logo to base64.

```bash
cat picture.jpg | base64
```

2. Seach in the script the word "BEGIN IMAGE" in the script and make the adjustment.

Between these tags.

```
<!-- BEGIN IMAGE -->
 ...
<!-- END IMAGE -->
```

Change for your enterprise name in alternate name tag.

```
alt=\"Cybionet\"
```

Select the type of image used.
  - jpeg
  - png
  - svg+xml

By example,

For jpg picture

```
src=\"data:image/jpg;base64
```

For png picture

```
src=\"data:image/png;base64
```

For svg picture

```
src=\"data:image/svg+xml;base64
```

Replace the base64 image with your own.


## SMTP Client (_optional_)

This section is only to help people set up email sending from their machine. use whatever method you want, it doesn't matter.

1. Configure email sending.

A. For direct sending of emails with Exim4, uses the commande.

```bash
dpkg-reconfigure exim4-config
```

```
mail sent by smarthost; no local mail
System mail name:  example.com
IP-addresses to listen on for incoming SMTP connections: 127.0.0.1
Other destinations for which mail is accepted: server.example.com
Visible domain name for local users: example.com
IP address or host name of the outgoing smarthost: smtp.example.com
Keep number of DNS-queries minimal (Dial-on-Demand)? No
Split configuration into small files? No
```

B. Authenticated sending of email or from a non-commercial connection that requires authentication with SSMTP.

```bash
vim /etc/ssmtp/ssmtp.conf
```

```
# ## Config file for sSMTP sendmail





## SMTP Client (_optional_)
  
This section is only to help people set up email sending from their machine. use whatever method you want, it doesn't matter.

1. Configure email sending.

A. For direct sending of emails with Exim4, uses the commande.

```bash
dpkg-reconfigure exim4-config
```

```
mail sent by smarthost; no local mail
System mail name:  example.com
IP-addresses to listen on for incoming SMTP connections: 127.0.0.1
Other destinations for which mail is accepted: server.example.com
Visible domain name for local users: example.com
IP address or host name of the outgoing smarthost: smtp.example.com
Keep number of DNS-queries minimal (Dial-on-Demand)? No
Split configuration into small files? No
```

B. Authenticated sending of email or from a non-commercial connection that requires authentication with SSMTP.

```bash
vim /etc/ssmtp/ssmtp.conf
```

```
# ## Config file for sSMTP sendmail

# ## The person who gets all mail for userids < 1000
# ## Make this empty to disable rewriting.
root=postmaster

# ## The destination server where the email goes. The name of the machine is required,
# ## no MX record is consulted. Usally, mailhosts are named mail.example.com.
:25, :465, :587 and :2525
mailhub=mail.example.com

# ## Where will the mail seem to come from?

#rewriteDomain=
```

---
[logo]: ./md/logo.png "Cybionet"
