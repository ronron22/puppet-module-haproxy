class haproxy::config (

	$nodename = hiera('nodename'),
	$configuration_directory = hiera('configuration_directory'),
	$service_name = hiera('haproxy::service::service_name'),
    
	) inherits haproxy {

    file { $configuration_directory :
      ensure => present,
      sourceselect => all,
      source => ["puppet:///modules/haproxy/${nodename}/etc/haproxy","/etc/haproxy "],
      recurse => true,
      notify   => Service[$service_name],  
    }

}
