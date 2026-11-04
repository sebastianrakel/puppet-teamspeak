class teamspeak::teamspeak6(
  Stdlib::AbsolutePath $install_location = "${teamspeak::home}/teamspeak6"
) {
  file { $install_location:
    ensure  => 'directory',
    owner   => $teamspeak::user,
    group   => $teamspeak::group,
    require => [User[$teamspeak::user], Group[$teamspeak::group]],
  }
  
  contain teamspeak::teamspeak6::install
  contain teamspeak::teamspeak6::service
}
