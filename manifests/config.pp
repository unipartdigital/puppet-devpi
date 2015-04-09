class devpi::config (
  $user        = $::devpi::user,
  $group       = $::devpi::group,
  $listen_host = $::devpi::listen_host,
  $listen_port = $::devpi::listen_port,
  $server_dir  = $::devpi::server_dir,
  $refresh     = $::devpi::refresh,
  $virtualenv  = $::devpi::virtualenv,
) {

  file { "/etc/init/${::devpi::service_name}.conf":
    ensure  => $::devpi::ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/upstart.erb")
  }

}
