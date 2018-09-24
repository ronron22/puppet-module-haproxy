class haproxy {
        
	include haproxy::install
	include haproxy::config
	include haproxy::service

}
