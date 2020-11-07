class teamspeak::install {
  group { $teamspeak::group:
    ensure => present,
  }

  user { $teamspeak::user:
    managehome => true,
    home       => $teamspeak::install_location,
    groups     => $teamspeak::group,
    require    => Group[$teamspeak::group],
  }

  $teamspeak_dirs = [
    $teamspeak::install_location,
    "${teamspeak::install_location}/downloads"
  ]

  file { $teamspeak_dirs:
    ensure  => 'directory',
    owner   => $teamspeak::user,
    group   => $teamspeak::group,
    require => [User[$teamspeak::user], Group[$teamspeak::group]],
  }

  $teamspeak_run_path = "${teamspeak::install_location}/downloads/teamspeak.run"
  file { $teamspeak_run_path:
    source  => $teamspeak::source,
    require => [File[$teamspeak_dirs]],
  }

  exec { 'extract_teamspeak':
    command => "${teamspeak_run_path} --tar xvaf -C ${teamspeak::install_location}",
    require => [File[$teamspeak_run_path], File[$teamspeak::install_location]],
  }
}
