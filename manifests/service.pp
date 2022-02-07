#= devpi::service
class devpi::service {
  require devpi::files

  service { $devpi::service_name:
    ensure => $devpi::service_ensure,
    enable => $devpi::service_enable,
  }

}
