class devpi::config (
  $user        = $::devpi::user,
  $group       = $::devpi::group,
  $listen_host = $::devpi::listen_host,
  $listen_port = $::devpi::listen_port,
  $server_dir  = $::devpi::server_dir,
  $virtualenv  = $::devpi::virtualenv,
  $proxy       = $::devpi::proxy,
) inherits ::devpi::params {

  if $::devpi::params::systemd {
    $devpi_path = $virtualenv ? {
      '' => '/usr/bin/devpi-server',
      default => "${virtualenv}/bin/devpi-server"
    }
    file { "/usr/lib/systemd/system/${::devpi::service_name}.service":
      ensure  => $::devpi::ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/systemd.service.erb")
    }
  } else {
    file { "/etc/init/${::devpi::service_name}.conf":
      ensure  => $::devpi::ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/upstart.erb")
    }
  }

}
