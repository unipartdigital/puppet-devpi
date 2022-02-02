class devpi::config (
  $user              = $::devpi::user,
  $group             = $::devpi::group,
  $listen_host       = $::devpi::listen_host,
  $listen_port       = $::devpi::listen_port,
  $server_dir        = $::devpi::server_dir,
  $virtualenv        = $::devpi::virtualenv,
  $proxy             = $::devpi::proxy,
  $config_dir        = $::devpi::config_dir,
  $config_file       = $::devpi::config_file,
  $ldap_connection   = $::devpi::ldap_connection,
  $ldap_user_filter  = $::devpi::ldap_user_filter,
  $ldap_group_base   = $::devpi::ldap_group_base,
  $ldap_group_filter = $::devpi::ldap_group_filter,
  $ldap_group_attr   = $::devpi::ldap_group_attr,
) inherits ::devpi::params {

  file { $config_dir:
    ensure => directory
  }

  file { $config_file:
    content => template("${module_name}/etc/devpi/config.yaml"),
    require => File[$config_dir]
  }

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
