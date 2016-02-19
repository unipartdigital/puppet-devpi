#!/usr/bin/env bats

@test "service devpi-server should be running" {
  pgrep devpi-server
}

@test "should listen on port 3141" {
  netstat -ltpn|grep :3141
}

@test "pip install virtualenv through devpi proxy" {
  pip install -i http://localhost:3141/root/pypi/ virtualenv
  pip freeze | grep virtualenv
}
