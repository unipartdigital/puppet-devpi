class devpi::systemd {
  exec { 'devpi_systemctl_daemon_reload':
    command     => 'systemctl daemon-reload',
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    refreshonly => true
  }
}
