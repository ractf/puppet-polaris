# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include polaris::node
class polaris::node (
  Sensitive[String]       $sensitive_consul_token,
  Sensitive[String]       $sensitive_single_user_username,
  Sensitive[String]       $sensitive_single_user_password,
  Optional[String]        $sentry_dsn,

  Boolean                 $manage_package                = true,
  String                  $package_name                  = 'polaris',
  String                  $package_ensure                = 'latest',

  Boolean                 $manage_service                = true,
  Stdlib::Ensure::Service $service_ensure                = 'running',

  Integer                 $thread_pool_size              = 5,
  Integer                 $task_threat_pool_size         = 5,
  Integer                 $reconciliation_tick_frequency = 20000,
  Integer                 $host_info_sync_frequency      = 20000,
  String                  $scheduling_algorithm          = 'roundRobin',
  Integer                 $threadpool_timeout_seconds    = 30,
  Stdlib::Port            $min_port                      = 20000,
  Stdlib::Port            $max_port                      = 65535,
  String                  $client_refresh_interval       = '10 seconds',
  String                  $consul_host                   = 'localhost',
  Stdlib::Port            $consul_port                   = '8500',
  String                  $consul_service_id             = 'polaris-controller',
  String                  $consul_retry_interval         = '5 seconds',
  Stdlib::Port            $application_connector_port    = 9090,
  Stdlib::Port            $admin_connector_port          = 9090,
  Boolean                 $kill_orphans                  = true,
) {
  contain polaris::repo
  contain polaris::install
  contain polaris::node::config
  contain polaris::node::service

  Class['polaris::repo']
  -> Class['polaris::install']
  -> Class['polaris::node::config']
  -> Class['polaris::node::service']
}
