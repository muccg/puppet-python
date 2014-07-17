#
define python::config(
  $owner = $name,
  $group = $owner,
  $home = "/home/${owner}",
  $index_url = 'https://pypi.python.org/simple') {

  file { "$home easy install config":
    ensure  => present,
    path    => "${home}/.pydistutils.cfg",
    content => template('python/pydistutils.cfg.erb'),
    owner   => $username,
    group   => $group
  }

  file { "${home}/.pip":
    ensure => directory,
    owner  => $username,
    group  => $group
  } ->

  file { "${home}/.pip/cache":
    ensure => directory,
    owner  => $username,
    group  => $group
  } ->

  file { "${home} pip conf":
    ensure  => present,
    path    => "${home}/.pip/pip.conf",
    content => template('python/pip.conf.erb'),
    owner   => $username,
    group   => $group
  }
}
