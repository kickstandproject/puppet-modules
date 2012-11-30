define asterisk::function::sip::registration(
  $host,
  $secret,
  $user,
  $domain = '',
  $extension = '',
) {
  require asterisk::server

  $base = "${asterisk::params::basedir}/sip.conf.d/registrations"

  file { "$base/${name}.conf":
    ensure  => file,
    content => template('asterisk/etc/asterisk/sip.conf.d/registrations/template.conf.erb'),
    notify  => Exec['asterisk-module-reload-sip.conf'],
    require => File[$base],
  }
}

# vim:sw=2:ts=2:expandtab
