| ![alt text][logo] | Integration & Securite Systeme |
| ------------- |:-------------:|

# Installation of the Loginalert script.

Install this script on the machine where you want to be alerted when the user logs on. It will send a email in HTML format at each authentication for a specific user.

## Requirement

 Use "apt-get" command to install these packages.
 - mutt


## Deployment

In the script, we use the "Mutt" application to send your warning email.

1. Installation of the mutt package.

```bash
  apt-get install mutt
```

2. Deployment of the alert script executable.

```bash
cp ./bin/loginalert /usr/bin/

chown root:root /usr/bin/loginalert
chmod 500 /usr/bin/loginalert
```

3. Add the script launch for a user. In this example, this is the root user.

```bash
vim /root/.bashrc
```

and add this line to the end of the file.

```
/usr/bin/loginalert
```


## Configuration

Adjust these variables in the script to your reality.

1. Configure the email recipient for the destination.

For a single recipient (TO).

```
emailTo='user@example.com' 
```

For a several recipients (TO).

```
emailTo='user1@example.com, user2@example.com'
```

2.  Configure the email for the sender.

Difined sender (FROM).

```
emailFrom='alert@example.com'
```

3. Configure this variable to allow one or more IP addresses or you can allow one or more subnets.

For an unique IP.

```
ALLOWIP='192.168.0.11'                
```

For multiple IP. Each IP addresses must be separated by space.

```
ALLOWIP='192.168.0.11 172.16.1.10'
```

For an IP range.

```
ALLOWIP='192.168.0'
```

For multiple IP range. Each IP range must be separated by space.

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

# ## The person who gets all mail for userids < 1000
# ## Make this empty to disable rewriting.
root=postmaster

# ## The place where the mail goes. The actual machine name is required no 
# ## MX records are consulted. Commonly mailhosts are named mail.domain.com
:25, :465, :587 and :2525
mailhub=mail.example.com

# ## Where will the mail seem to come from?

#rewriteDomain=
```

---
[logo]: https://md.cybiopress.com/logo200x36.png "Cybionet"
