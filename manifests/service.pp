class devpi::service {

  service { $::devpi::service_name:
    ensure   => $::devpi::service_ensure,
    enable   => $::devpi::service_enable,
    provider => 'upstart'
  }

}
