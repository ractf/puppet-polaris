# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include polaris::controller
class polaris::controller (
  Boolean                 $manage_service = true,
  Stdlib::Ensure::Service $service_ensure = 'running',
) {
}
