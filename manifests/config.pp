#= devpi::config
class devpi::config {

  file { $devpi::config_dir:
    ensure => directory
  }

  file { $devpi::config_file:
    content => template("${module_name}/etc/devpi/config.yaml"),
    require => File[$devpi::config_dir]
  }

  if $devpi::systemd {
    $devpi_path = $devpi::virtualenv ? {
      '' => '/usr/bin/devpi-server',
      default => "${devpi::virtualenv}/bin/devpi-server"
    }
    file { "/usr/lib/systemd/system/${devpi::service_name}.service":
      ensure  => $devpi::ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/systemd.service.erb")
    }
  } else {
    file { "/etc/init/${devpi::service_name}.conf":
      ensure  => $devpi::ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/upstart.erb")
    }
  }
}
