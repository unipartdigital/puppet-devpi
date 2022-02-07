#,
#
# Installs devpi - http://doc.devpi.net/latest/index.html
#
#,
#
# [*ensure*]
#   Ensurable
#
# [*package_name*]
#   Name of package to install
#
# [*client*]
#   Boolean if client package should be installed
#
# [*package_client*]
#   Name of client package to install
#
# [*service_refresh*]
#   Boolean if service should restart on config changes
#
# [*service_enable*]
#   Service type enable
#
# [*service_ensure*]
#   Service type ensure
#
# [*service_name*]
#   Name of service to manage
#
# [*user*]
#   Name of user running devpi
#
# [*group*]
#   Name of group of user running devpi
#
# [*manage_user*]
#   Boolean if user/group resource should be declared in this module
#
# [*listen_host*]
#   devpi-server --host parameter
#
# [*listen_port*]
#   devpi-server --port parameter
#
# [*refresh*]
#   devpi-server --refresh parameter
#
# [*server_dir*]
#   devpi-server --serverdir parameter
#
# [*virtualenv*]
#   Absolute path to sandboxed virtualenv directory. If set package is unmanaged
# [*config_file*]
#   Absolute path to devpi configuration yaml file
#
# [*proxy*]
#   HTTP url and port for http_proxy and https_proxy env variables (example: http://proxy.domain.tld:80)
#
#,
#
# include ::devpi
#
#,
#
# Copyright 2015 North Development AB
#
class devpi (
  String $ensure,
  String $package_name,
  Boolean $client,
  String $package_client,
  Boolean $service_refresh,
  Boolean $service_enable,
  String $service_ensure,
  String $service_name,
  String $user,
  String $group,
  Boolean $manage_user,
  String $listen_host,
  Integer $listen_port,
  Integer $refresh,
  String $server_dir,
  String $config_dir,
  String $config_file,
  Optional[String] $virtualenv = undef,
  Optional[String] $proxy = undef,
  Optional[String] $ldap_connection = undef,
  Optional[String] $ldap_user_filter = undef,
  Optional[String] $ldap_group_base = undef,
  Optional[String] $ldap_group_filter = undef,
  Optional[String] $ldap_group_attr = undef,
) {

  contain ::devpi::user
  contain ::devpi::package
  contain ::devpi::config
  contain ::devpi::files
  contain ::devpi::service

  Class['::devpi::config']
  ~>Class['::devpi::service']

}
