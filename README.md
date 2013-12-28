# PyroCMS Puppet

Configuration for [vagrant](http://vagrantup.com/) and puppet systems, allowing you to build a PyroCMS-friendly environment in next to no-time. 
That means that instead of needing to install XAMPP/WAMPP/MAMP, fight with the built in version of Apache on your Mac or configure some slow 
over-the-network VPS to run your code you can use our Vagrant / Puppy setup to run PyroCMS in its own little virtual box.

## Manfiests

The names of our manifests are fairly obvious:

* ubuntu-apache2-mysql-php5.pp
* ubuntu-apache2-pgsql-php5.pp
* ubuntu-apache2-sqlite-php5.pp

These are not tied to specific versions of Apache, PHP or their database systems, but will install 
whatever they can via apt, looking at the default repositories for the version of Ubuntu you decide 
on using. 

Do not try using these on 13.04 or 13.10, as Ubuntu uses Apache 2.4 and for some reason these modules 
are rather broken for that version. 12.10 works very nicely. 

### MySQL Credentials

__Database:__ pyrocms
__User:__ pyrocms  
__Pass:__ password  

### PostgreSQL Credentials

__Database:__ pyrocms
__User:__ pyrocms  
__Pass:__ password  

### SQLite Credentials

__Database:__ /vagrant/db/pyrocms.sqlite 

## Adding Manifiests

The place is to add multiple "stock" Puppet manifest files in `manifests/` for various setups like:
	
* ubuntu + nginx + PHP 5 + MySQL
* ubuntu + nginx + PHP 5 + Postgres
* ubuntu + nginx + PHP 5 + SQLite
* centos + apache + PHP 5 + SQLite
* centos + nginx + PHP 5 + Postgres

If you would like to submit a manfest, please simply send in a pull request with a logical name, 
like `ubuntu-nginx-php5-mysql.pp` and we'll merge it.
