###########################
# PyroCMS Puppet Config   #
###########################
# OS          : Linux     #
# Database    : MySQL 5   #
# Web Server  : Apache 2  #
# PHP version : 5.4       #
###########################

include php

# Apache setup
class {'apache': 
    mpm_module => 'prefork'
}
class {'apache::mod::php': }

apache::vhost { $fqdn :
	priority => '20',
	port => '80',
	docroot => $docroot,
    override => "All"
}

apache::mod { 'rewrite': }

# PHP Extensions
php::module { ['xdebug', 'mysql', 'curl', 'gd'] : 
    notify => [ Service['httpd'], ],
}

# MySQL Server
class { '::mysql::server':
  root_password    => 'l1k3ab0ss',
}


mysql::db { 'pyrocms':
    user     => 'pyrocms',
    password => 'password',
    host     => 'localhost',
    grant    => ['all'],
    charset => 'utf8',
}

# Other Packages
$extras = ['vim', 'curl', 'phpunit']
package { $extras : ensure => 'installed' }

# PyroCMS Setup

file { $docroot:
    ensure  => 'directory',
}

file { "${docroot}system/cms/config/config.php":
    ensure  => "present",
    mode    => "0666",
    require => File[$docroot],
}

$writeable_dirs = ["${docroot}system/cms/cache/", "${docroot}system/cms/config/", "${docroot}addons/", "${docroot}assets/cache/", "${docroot}uploads/"]

file { $writeable_dirs:
    ensure => "directory",
    mode   => '0777',
    require => File[$docroot],
}