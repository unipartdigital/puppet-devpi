class devpi::package {

  package { $::devpi::package_name:
    ensure   => $::devpi::ensure,
    provider => pip3
  }

  if $::devpi::client {
    package { $::devpi::package_client:
      ensure   => $::devpi::ensure,
      provider => pip3
    }
  }

}
