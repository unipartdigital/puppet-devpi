#= devpi::config
class devpi::config {
  require devpi::package

  file { $devpi::config_dir:
    ensure => directory
  }

  file { $devpi::config_file:
    content => template("${module_name}/etc/devpi/config.yaml"),
    require => File[$devpi::config_dir]
  }

  file { "/usr/lib/systemd/system/${devpi::service_name}.service":
    ensure  => $devpi::ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/systemd.service.erb")
  }
}
