class pagerduty::config {

  require pagerduty::params

  file {"${::pagerduty::params::icinga_cfg_path}/objects/pagerduty_icinga.cfg":
    ensure  => present,
    content => template('pagerduty/pagerduty_icinga.cfg.erb'),
    owner   => 'icinga',
    group   => 'icinga',
  }

  file {'/usr/local/bin/pagerduty_icinga.pl':
    ensure => present,
    source => 'puppet:///modules/pagerduty/pagerduty_icinga.pl',
    mode   => '0755',
  }

  cron {'pagerduty':
    ensure  => present,
    user    => 'icinga',
    command => '/usr/local/bin/pagerduty_icinga.pl flush',
  }

}

