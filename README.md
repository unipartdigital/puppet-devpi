# devpi

[![Build Status](https://secure.travis-ci.org/unibet/puppet-devpi.png)](http://travis-ci.org/unibet/puppet-devpi)
[![Puppet Forge](https://img.shields.io/puppetforge/v/unibet/devpi.svg)](https://forge.puppetlabs.com/unibet/devpi)
[![Puppet Forge](https://img.shields.io/puppetforge/f/unibet/devpi.svg)](https://forge.puppetlabs.com/unibet/devpi)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with devpi](#setup)
    * [What devpi affects](#what-devpi-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with devpi](#beginning-with-devpi)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Manages devpi - PyPI server and packaging/testing/release tool

## Module Description

Installs devpi via pip, manages upstart/systemd script and service.

## Setup

### What devpi affects

* Creates serverdir in /opt/devpi (configurable)
* Creates user devpi (configurable)
* Creates service devpi-server
* Installs pip package devpi-server
* Optionally installs pip package devpi-client

### Setup Requirements

Requires python, pip and modern enough setuptools

### Beginning with devpi

Install it using PMT:
```
puppet module install unibet-devpi
```

## Usage

Usage in its simplest form:

```
class { '::devpi': }
```

If you want the client installed as well:

```
class { '::devpi':
  client => true
}
```

You may want to install devpi contained in a virtualenv in which case you could declare it as follows (using the stankevich-python module for virtualenv management):

```
$virtualenv = '/venv'

::python::virtualenv { $virtualenv:
  ensure     => present,
  systempkgs => false,
  timeout    => 0,
}

::python::pip { 'devpi-server':
  pkgname    => 'devpi-server==2.1.5',
  virtualenv => $virtualenv,
}

class { '::devpi':
  virtualenv  => $virtualenv
}
```

Setting custom port and host listener:

```
class { '::devpi':
  listen_host => '127.0.0.1',
  listen_port => 13141
}
```

## Reference

The only external facing class should be "devpi". It uses the anchor pattern for class containment so you can form dependencies to Class['devpi'] and expect all resources declared within the devpi class to be realized.

## Limitations

Only tested on EL6 and EL7

## Development

We welcome all pull requests that comes with rspec tests covering the new functionality.

Tests can be executed locally using bundler:
```
bundle install
bundle exec rake lint
bundle exec rake validate
bundle exec rake spec
```
