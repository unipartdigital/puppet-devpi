class devpi::service inherits ::devpi::params {

  $provider = $::devpi::params::systemd ? {
    true    => 'systemd',
    default => 'upstart'
  }

  service { $::devpi::service_name:
    ensure   => $::devpi::service_ensure,
    enable   => $::devpi::service_enable,
    provider => $provder
  }

}
