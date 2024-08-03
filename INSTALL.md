 ![alt text][logo]

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
   git clone https://github.com/cybiohub/sc_loginalert.git
   ```

2. Make changes to the install script to configure it to match your environment.
   ```bash
   vim ./conf/loginalert.conf
   ```

	You need to customize the following settings:

	- The destination email address(es).
	- The sending email address.
	- The IP address(es) or range of IP addresses authorized to connect.
	- The excluded user.
	- Your logo in jpeg, png or svg format converted to base64.

> [!NOTE]
> Don't forget to set the 'isConfigured' parameter to 'true', otherwise the script will not be apply. This is for security purposes for your environment.

3. Deploy the executable of the `loginalert` script.
   ```bash
   cp ./bin/loginalert /usr/bin/
   chown root:root /usr/bin/loginalert
   chmod 500 /usr/bin/loginalert
   ```

4. Deploy the configuration file.

   ```bash
   cp ./conf/loginalert.conf /etc/
   ```
		
5. Add the following entry to the files in the pam.d directory. You should do this at a minimum for `sshd`, but we recommend that you also add the line in the `login`, `su` and `sudo` files.
   ```bash
   vim /etc/pam.d/sshd
   vim /etc/pam.d/login
   vim /etc/pam.d/su
   vim /etc/pam.d/sudo
   ```

   and add this line to the end of the last `session` parameters in the file.
   ```bash
   session optional pam_exec.so seteuid /usr/bin/loginalert
   ```


<br>

## CONFIGURATION

1. Edit the configuration file.
   ```bash
   vim /etc/loginalert.conf
   ```

2. Configure the recipient's email addresses.

    For a single recipient (TO). Download files from this repository directly with git or via https.
   ```
   emailTo='user@example.com'
   ```

3. For a several recipients (TO). The delimiter is the comma and spaces don't matter.
   ```
   emailTo='user1@example.com, user2@example.com'
   ```

4. Configure the sender's email address.

    Defined sender (FROM).
   ```
   emailFrom='notification@example.com'
   ```

5. Configure this variable to allow one or more IP addresses or you can allow one or more subnets.

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

Supported image formats: jpeg, png et svg 
Maximum image size: 312 x 56

1. Start by converting your header logo to base64.
   ```bash
   cat picture.jpg | base64
   ```

2. Change to your business name in the alternate name tag.
   ```
   myLogoAlt='Cybionet'
   ```

3. And select the type of image used.
     - jpeg
     - png
     - svg+xml

    By example for an image in png format.
   ```
   myLogoMime='png'
   ```

    For an image in jpeg format.
   ```
   myLogoMime='jpeg'
   ```

    For an image in svg format.
   ```
   myLogoMime='svg+xml'
   ```

4. In the configuration file, find the `myLogo` parameter and replace the value with the result of the base64 conversion.

    Replace the base64 image with your own.
   ```
   myLogo=''
   ```

5. Voilà! Enjoy!

---
[logo]: ./md/logo.png "Cybionet"
