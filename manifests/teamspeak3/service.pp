class teamspeak::teamspeak3::service {
  systemd::unit_file { 'teamspeak3.service':
    content => epp("${module_name}/teamspeak3.service.epp", {
      install_location => $teamspeak::teamspeak3::install_location,
      user             => $teamspeak::user,
    }),
  }
  ~> service { 'teamspeak3':
    ensure => 'running',
    enable => true,
  }
}
