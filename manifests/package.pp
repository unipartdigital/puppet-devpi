class devpi::package {

  package { $::devpi::package_name:
    ensure   => $::devpi::ensure,
    provider => pip
  }

}
