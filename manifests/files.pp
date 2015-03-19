class devpi::files {

  $dir_ensure = $::devpi::ensure ? {
    present => directory,
    default => $::devpi::ensure
  }

  file { $::devpi::server_dir:
    ensure => $dir_ensure,
    owner  => $::devpi::user,
    group  => $::devpi::group,
    mode   => '0700'
  }
    
}
