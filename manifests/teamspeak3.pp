class teamspeak::teamspeak3(
  Stdlib::AbsolutePath $install_location = "${teamspeak::home}/teamspeak3"
) {
  file { $install_location:
    ensure  => 'directory',
    owner   => $teamspeak::user,
    group   => $teamspeak::group,
    require => [User[$teamspeak::user], Group[$teamspeak::group]],
  }
  
  contain teamspeak::teamspeak3::install
  contain teamspeak::teamspeak3::service
}
