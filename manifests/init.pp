#
class python {

  include python::params
  include python::indexurl

  package { $python::params::packages:
      ensure => installed,
  }

  package { $python::params::development_packages:
      ensure => installed,
  }
}
