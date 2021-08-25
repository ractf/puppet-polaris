# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include polaris::node
class polaris::node (
  Boolean                 $manage_package = true,
  Boolean                 $package_name   = 'polaris',
  Enum['latest', SemVer]  $package_ensure = 'latest',

  Boolean                 $manage_service = true,
  Stdlib::Ensure::Service $service_ensure = 'running',
) {
  contain polaris::repo
  contain polaris::node::install
  contain polaris::node::config
  contain polaris::node::service

  Class['polaris::node']
  -> Class['polaris::node::install']
  -> Class['polaris::node::config']
  -> Class['polaris::node::service']
}
