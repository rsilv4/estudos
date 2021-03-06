# Class: apache::vhosts
#
#
class apache::vhosts {
  if $::osfamily == 'RedHat'{
    file {'/etc/httpd/conf.d/vhost.conf':
      ensure => file,
      content => template('apache/vhosts-rh.conf.erb')
    }

    file {"/var/www/$servername":
      ensure: directory,
    }

    file {"/var/www/$servername/public_html":
      ensure: directory,
    }

    file {"/var/www/$servername/logs":
      ensure: directory,
    }

  }elseif $::osfamily == 'Debian'{
    file {'/etc/apache2/sites-available/$servername.conf':
      ensure => file,
      content => template('apache/vhosts-deb.conf.erb'),
    }

    file {"/var/www/$servername":
      ensure: directory,
    }

    file {"/var/www/$servername/public_html":
      ensure: directory,
    }

    file {"/var/www/$servername/logs":
      ensure: directory,
    }

  }else {
    print "This is not a supported distro"
  }
}
