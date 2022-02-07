#= devpi::files
class devpi::files {
  require devpi::config

  $dir_ensure = $devpi::ensure ? {
    present => directory,
    default => $devpi::ensure
  }

  file { $devpi::server_dir:
    ensure => $dir_ensure,
    owner  => $devpi::user,
    group  => $devpi::group,
    mode   => '0700'
  }

  exec { 'devpi-init':
    command => "/usr/local/bin/devpi-init -c ${devpi::config_file}",
    user    => $devpi::user,
    creates => "${devpi::server_dir}/.nodeinfo",
    require => File[$devpi::server_dir]
  }
}
