class pagerduty::package{


  package {'perl-libwww-perl':
    ensure => present;
  }

  package {'perl-Crypt-SSLeay':
    ensure => present;
  }
}
