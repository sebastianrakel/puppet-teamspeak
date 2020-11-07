class teamspeak::config {
  systemd::unit_file { 'teamspeak3.service':
    content => epp("${module_name}/teamspeak3.service.epp", {
      install_location => $teamspeak::home,
      user             => $teamspeak::user,
    }),
  }
  ~> service { 'teamspeak3':
    ensure => 'running',
    enable => true,
  }
}
