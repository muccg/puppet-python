#
class python {
  if $::osfamily == 'redhat' {
    include repo::repo::ius
  }

  include python::params
  
  if ($::ssh_user and $::ssh_user != 'root') {
    python::config { $::ssh_user: }
  }

  python::config { 'root': 
    home => '/root'
  }

  package { $python::params::packages:
    ensure => installed,
  }

  package { $python::params::development_packages:
    ensure => installed,
  }
}
