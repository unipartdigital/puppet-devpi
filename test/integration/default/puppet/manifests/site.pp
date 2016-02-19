package { 'epel-release': ensure => installed } ->
package { 'python-pip': ensure => installed } ->
exec { 'easy_install -U setuptools || exit 0':
  path => [ '/bin', '/usr/bin']
} ->
class { '::devpi':
  client => true
}

if $::operatingsystemmajrelease == '7' {
  file { '/usr/bin/pip-python':
    ensure  => link,
    target  => '/usr/bin/pip',
    require => Package['python-pip'],
    before  => Class['::devpi']
  }
}
