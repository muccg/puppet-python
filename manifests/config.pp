#
define python::config(
  $owner = $name,
  $group = $owner,
  $home = undef,
  $index_url = 'https://pypi.python.org/simple') {

  if ($home == undef) {
    $homedir = "/home/${owner}"
  } else {
    $homedir = $home
  }

  file { "${homedir} easy install config":
    ensure  => present,
    path    => "${homedir}/.pydistutils.cfg",
    content => template('python/pydistutils.cfg.erb'),
    owner   => $owner,
    group   => $group
  }

  file { "${homedir}/.pip":
    ensure => directory,
    owner  => $owner,
    group  => $group
  } ->

  file { "${homedir}/.pip/cache":
    ensure => directory,
    owner  => $owner,
    group  => $group
  } ->

  file { "${homedir} pip conf":
    ensure  => present,
    path    => "${homedir}/.pip/pip.conf",
    content => template('python/pip.conf.erb'),
    owner   => $owner,
    group   => $group
  }
}
