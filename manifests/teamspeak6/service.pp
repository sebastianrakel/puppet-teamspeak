class teamspeak::teamspeak6::service {
  systemd::unit_file { 'teamspeak6.service':
    content => epp("${module_name}/teamspeak6.service.epp", {
      install_location => $teamspeak::teamspeak6::install_location,
      user             => $teamspeak::user,
    }),
  }
  ~> service { 'teamspeak6':
    ensure => 'running',
    enable => true,
  }
}
