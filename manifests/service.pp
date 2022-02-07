#= devpi::service
class devpi::service {

  $provider = $devpi::systemd ? {
    true    => 'systemd',
    default => 'upstart'
  }

  service { $devpi::service_name:
    ensure   => $devpi::service_ensure,
    enable   => $devpi::service_enable,
    provider => $provider
  }

}
