#
class python::params {

  case $::operatingsystem {

    'CentOS': {
      $packages = ['python27', 'python27-virtualenv', 'python27-pip', 'python33']
      $development_packages = ['python27-devel', 'python33-devel']
    }

    'Debian', 'Ubuntu': {
      $packages = ['python', 'python3']
      $development_packages = ['python-dev', 'python3-dev']
    }

    default: {
      fail("${module_name} provides not supported for ${::operatingsystem}")
    }
  }
}
