class haproxy::install (

	$haproxy_packages = hiera('haproxy_packages'),

	) inherits haproxy {
        
		$haproxy_packages.each |String $package|{
			package { $package: 
				ensure  =>  installed,
			}
		}

}
