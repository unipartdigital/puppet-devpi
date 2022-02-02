class devpi::params {
  $user              = 'devpi'
  $group             = 'devpi'
  $package           = 'devpi-server'
  $package_client    = 'devpi-client'
  $service           = 'devpi-server'
  $server_dir        = '/opt/devpi'
  $proxy             = undef
  $systemd           = true
  $config_dir        = '/etc/devpi'
  $config_file       = '/etc/devpi/config.yaml'
  #  case $::osfamily {
  #    redhat: {
  #      $systemd = $::operatingsystemmajrelease ? {
  #        5       => false,
  #        6       => false,
  #        default => true
  #      }
  #    'Debian': {
  #      $systemd = true
  #    }
  #    default: {
  #      fail("Unsupported :osfamily ${::osfamily}")
  #    }
  #  }

}
