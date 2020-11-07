class teamspeak::config {
  systemd::unit_file { 'foo.service':
    content => epp("${module_name}/teamspeak.service.epp"),
  }
  ~> service {'teamspeak':
    ensure => 'running',
  }
}
