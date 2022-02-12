| ![alt text][logo] | Integration & Securite Systeme |
| ------------- |:-------------:|

# Cybionet - Ugly Codes Division

## REQUIRED

The `loginalert` application requires the following additional packages to work.

 Use `apt-get` command to install these dependencies.
 - mutt
 - whois
 - gpgsm

<br>

## INSTALLATION

1. Download files from this repository directly with git or via https.
   ```bash
  wget -o loginalert.zip https://github.com/cybiohub/sc_loginalert/archive/refs/heads/main.zip
   ```

2. Unzip the zip file.
   ```bash
  unzip loginalert.zip
   ```

3. Make changes to the install script to configure it to match your environment.

	==You need to customize the following settings:==

	- The destination email address(es).
	- The sending email address.
	- The IP address(es) or range of IP addresses authorized to connect.
	- The excluded user.
	- Your logo in jpeg, png or svg format converted to base64.

4. Once completed, set the `Configured` parameter to `true`.

5. Deploy the executable of the `loginalert` script.

   ```bash
  cp ./bin/loginalert /usr/bin/
  chown root:root /usr/bin/loginalert
  chmod 500 /usr/bin/loginalert
   ```
		
6. Add the following entry to the files in the pam.d directory. You should do this at a minimum for `sshd`, but we recommend that you also add the line in the `login`, `su` and `sudo` files.

   ```bash
  vim /etc/pam.d/sshd
  vim /etc/pam.d/login
  vim /etc/pam.d/su
  vim /etc/pam.d/sudo
   ```

   and add this line to the end of the last `session` parameters in the file.

   ```bash
  session optional pam_exec.so /usr/bin/loginalert
   ```

<br>

## CONFIGURATION

1. Configure the recipient's email address.

    For a single recipient (TO).Download files from this repository directly with git or via https.
   ```
   emailTo='user@example.com'
   ```

2. For a several recipients (TO). The delimiter is the comma and spaces don't matter.
   ```
   emailTo='user1@example.com, user2@example.com'
   ```

3. Configure the sender's email address.

    Defined sender (FROM).
   ```
   emailFrom='alert@example.com'
   ```

4. Configure this variable to allow one or more IP addresses or you can allow one or more subnets.

    For an unique IP.
   ```
   ALLOWIP='192.168.0.11'
   ```

    For an IP address range.
   ```
   ALLOWIP='192.168.0'
   ```

    For multiple IP address ranges. Each range of IP addresses must be separated by space.
   ```
   ALLOWIP='192.168.0 172.16.0 10.0.0'
   ```

<br>

### Custom logo header

==Supported image formats: jpeg, png et svg. Maximum size: 312 x 56==

1. Convert your header logo to base64.
   ```bash
   cat picture.jpg | base64
   ```

2. Seach in the script the word `BEGIN IMAGE` in the script and make the adjustment.

   Between these tags.
   ```
   <!-- BEGIN IMAGE -->
   ...
   <!-- END IMAGE -->
   ```

   Change to your business name in the alternate name tag.
   ```
   alt=\"Cybionet\"
   ```

   And select the type of image used.
     - jpeg
     - png
     - svg+xml

   By example for an image in jpeg format.
   ```
   src=\"data:image/jpg;base64
   ```

        For an image in png format.
        ```
        src=\"data:image/png;base64
        ```

   For an image in svg format.
   ```
   src=\"data:image/svg+xml;base64
   ```

   Replace the base64 image with your own.

9. Voilà! Enjoy!

<br>

## SMTP Client (_optional_)

This section is only intended to help users configure sending emails from their machine. Use whatever method you want, it doesn't matter.

### Send with Exim4

First method is with `Exim4` services.

1. Configure the sending of emails.
   a. For direct sending of emails with Exim4, uses the commande.

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

   b. Manual verification.
     Create a message.
   ```bash
   vim mail.txt
   ```

   ```
   This is an email verification email service. Thank you for not replying to this message.
   ```
  
   Send the message.
   ```bash
   cat mail.txt | /usr/bin/mail -s "Email verification" "user@example.com"
   ```

<br>

 ### Config with SSMTP
  
The second method you can use is with the `SSMTP` application. It will allow authenticated sending of email or from a non-commercial connection requiring authentication.

1. Configure the sending of emails.
   a. Install ssmtp package.
   ```bash
   apt-get install ssmtp
   ```

   b. Authenticated sending of email or from a connection that requires authentication with SSMTP.

   ```bash
   vim /etc/ssmtp/ssmtp.conf
   ```

   ```
   root=postmaster
   
   #:25, :465, :587 and :2525
   mailhub=mail.example.com:25
   
   hostname=mail.example.com

   Authuser=username
   AuthPass=password
   UseTLS=YES
   ```

   c. Manual verification.
   
   Create a message.
   ```bash
   vim mail.txt
   ```

   ```
   To: user[[@example.com]]
   From: user[[@example.com]]
   Subject: Email verification
   
   This is an email verification email service. Thank you for not replying to this message.
   ```
  
   Send the message.
   ```bash
   /usr/sbin/ssmtp user@example.com < mail.txt
   ```

---
[logo]: ./md/logo.png "Cybionet"
