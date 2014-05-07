#
class python::indexurl(
  $index_url = 'https://pypi.python.org/simple',
  $username = $::ssh_user,
  $group = $::ssh_user) {

  if $username == 'root' {
    $home = '/root'
  }
  else {
    $home = "/home/${username}"
  }

  file { 'easy install config':
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

  file { 'pip config':
    ensure  => present,
    path    => "${home}/.pip/pip.conf",
    content => template('python/pip.conf.erb'),
    owner   => $username,
    group   => $group
  }
}