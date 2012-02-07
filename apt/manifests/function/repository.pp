define apt::function::repository (
    $url,
    $dist = $lsbdistcodename,
    $components,
    $protocol = 'http://',
) {
    require apt::client

    file { "${name}.list":
        ensure	=> present,
	content	=> template('apt/client/etc/apt/sources.list.d/repo.list'),
	group	=> 'root',
	mode	=> '0644',
	owner	=> 'root',
	path	=> "${apt::params::configdir}/sources.list.d/${name}.list",
	notify	=> Exec['apt-get update'],
    }
}
