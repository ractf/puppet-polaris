# @summary Install the Polaris RPM repo
#
# This class manages the installation of the RACTF RPM repo.
# In future this may support DEBs, and may become its own module.
#
# @api private
#
class polaris::repo {
  if $polaris::manage_repo {
    if $facts['os']['family'] == 'RedHat' {
      yumrepo { 'ractf':
        name    => 'RACTF',
        descr   => 'RACTF Package Repo',
        baseurl => 'TODO'
      }
    } else {
      fail('Non-RedHat based operating systems are not supported yet')
    }
  }
}
