# =Class devpi::package
# 
# Install devpi using pip3
# 
# TODO: add LDAP functionality
# TODO: generalised plugin functionality
class devpi::package {

  package { $devpi::package_name:
    ensure   => $devpi::ensure,
    provider => pip3
  }

  package { 'devpi-lockdown':
    ensure   => $devpi::ensure,
    provider => pip3
  }

  package { 'devpi-ldap':
    ensure   => $devpi::ensure,
    provider => pip3
  }

  if $devpi::client {
    package { $devpi::package_client:
      ensure   => $devpi::ensure,
      provider => pip3
    }
  }

}
