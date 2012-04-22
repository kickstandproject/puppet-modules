class mcollective::classes::common {
	include mcollective::params
	include mcollective::classes::apt
	include mcollective::classes::install
	include mcollective::classes::config
	include mcollective::classes::service
}
