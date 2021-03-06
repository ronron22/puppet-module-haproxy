class haproxy::service (

	$service_name            = hiera('service_name'),
	$service_enable          = hiera('service_enable'),
	$service_ensure          = hiera('service_ensure'),
	$service_manage          = hiera('service_manage'),
	$configuration_directory = hiera('haproxy::config::configuration_directory'),

	) inherits haproxy {

	if ! ($service_ensure in [ 'running', 'stopped' ]) {
		fail('service_ensure parameter must be running or stopped')
	}
  if $service_manage == true {
    service { $service_name:
		  ensure      => $service_ensure,
      enable      => $service_enable,
		  provider    => systemd,
      #hasstatus  => true,
      #hasrestart => true,
    }
  }

}
