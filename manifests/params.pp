class devpi::params {
  $user = 'devpi'
  $group = 'devpi'
  $package = 'devpi-server'
  $package_client = 'devpi-client'
  $service = 'devpi-server'
  $server_dir = '/opt/devpi'
  $proxy = undef

  case $::osfamily {
    redhat: {
      $systemd = $::operatingsystemmajrelease ? {
        5       => false,
        6       => false,
        default => true
      }
    }
    default: {
      fail("Unsupported :osfamily ${::osfamily}")
    }
  }

}
