# My Dokuwiki on Vagrant

A virtual machine hosted installation of the [Dokuwiki
wiki](https://www.dokuwiki.org/dokuwiki).

What this does

    vagrant up

will load Ubuntu 12.04 `precise64` and provision it with Apache, PHP5 and Git. It will then
use git to get the latest stable build of Dokuwiki and install it in `/var/www`. It then
sets the file permissions and copies in my copy of the configuration files.

It will eventually copy in my templates and plugins and my data.

## Admin Account

DokuWiki is set up with an initial admin account, user name 'admin', password 'changeme'. You should 
of course not use these account details in production.
