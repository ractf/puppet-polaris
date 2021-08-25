# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @api private
#
class polaris::node::install {
  if $polaris::node::manage_package {
    ensure_packages($polaris::node::package_name, {
      ensure => $polaris::node::package_ensure,
      notify => Class['polaris::node::service'],
    })
  }
}
