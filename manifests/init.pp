class haproxy (
        $enable                                         = $::haproxy::params::enable,
        # remplacer les variables $::haproxy::params::enable, par le type ci-dessous
        $nodename = hiera('nodename'),
        ) {
        if $enable {
            package { 'haproxy':
               ensure  => present,
            }
            file { '/etc/haproxy/haproxy.cfg':
              ensure  => present,
              content => file("haproxy/${nodename}/etc/haproxy/haproxy.cfg"),
            }
            service { 'haproxy':
              ensure  => running,
              enable  => true,
              restart => 'haproxy -c -f /etc/haproxy/haproxy.cfg && service haproxy reload',
              require => File['/etc/haproxy/haproxy.cfg'],
            }
        }
}
