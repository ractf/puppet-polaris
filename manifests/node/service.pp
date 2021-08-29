# @summary Manage the Polaris Node service
#
# This class manages this Polaris Node service, which is packaged with the Polaris RPM.
#
# @api private
#
class polaris::node::service {
  if $polaris::node::manage_service {
    $service_enable = $polaris::node::service_ensure ? {
      'running' => true,
      'stopped' => false,
    }

    service {'polaris-node':
      ensure => $polaris::node::service_ensure,
      enable => $service_enable,
    }
  }
}
