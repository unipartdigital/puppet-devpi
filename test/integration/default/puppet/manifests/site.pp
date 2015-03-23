package { 'epel-release': ensure => installed } ->
package { 'python-pip': ensure => installed } ->
exec { 'easy_install -U setuptools || exit 0':
  path => [ '/bin', '/usr/bin']
} ->
class { '::devpi':
  client => true
}
