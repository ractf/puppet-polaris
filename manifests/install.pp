# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include polaris::install
class polaris::install {
  if $polaris::manage_package {
    ensure_packages($polaris::package_name, {
      ensure => $polaris::package_ensure,
    })
  }
}
