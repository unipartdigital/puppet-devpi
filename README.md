# devpi

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

Installs devpi via pip, manages upstart script and service.

## Setup

### What devpi affects

* Creates serverdir in /opt/devpi (configurable)
* Creates user devpi (configurable)
* Creates service devpi-server
* Installs pip package devpi-server

### Setup Requirements **OPTIONAL**

Requires python, pip and modern enough setuptools

### Beginning with devpi

```
puppet module install unibet-devpi
```

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

The only external facing class should be "devpi". Uses the anchor pattern for class containment, so you can form dependencies to Class['devpi'] and expect that all resources within the devpi module are executed.

## Limitations

Only tested on EL6

## Development

All pull requests are welcome

