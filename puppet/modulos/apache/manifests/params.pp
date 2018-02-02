# Class: apache::params
class apache::params {
  # resources
  if $::osfamily == 'RedHat'{
    $apachename = 'httpd'
    $configfile = '/etc/httpd/conf/httpd.conf'
    $confsource = 'puppet://modules/apache/httpd.conf'
  }elseif $::osfamily == 'Debian' {
    $apachename = 'apache2'
    $configfile = '/etc/apache2/apache2.conf'
    $confsource = 'puppet:///modules/apache/apache2.conf'
  }else {
    print "This is not a supported distro."
  }
}
