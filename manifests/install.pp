class teamspeak::install (
  Stdlib::HTTPUrl $teamspeak_source_url = getvar('teamspeak::teamspeak_source_url'),
) {
  group { $teamspeak::group:
    ensure => present,
  }

  user { $teamspeak::user:
    managehome => true,
    home       => $teamspeak::home,
    groups     => $teamspeak::group,
    require    => Group[$teamspeak::group],
  }

  $downloaddir = "${teamspeak::home}/downloads"

  $teamspeak_dirs = [
    $teamspeak::home,
    $downloaddir,
  ]

  file { $teamspeak_dirs:
    ensure  => 'directory',
    owner   => $teamspeak::user,
    group   => $teamspeak::group,
    require => [User[$teamspeak::user], Group[$teamspeak::group]],
  }

  $archivename = "teamspeak-${teamspeak::version}.tar.bz2"
  $teamspeak_download_destination = "${downloaddir}/${archivename}"

  archive { $archivename:
    source       => $teamspeak_source_url,
    path         => $teamspeak_download_destination,
    extract      => true,
    extract_path => $teamspeak::home,
    user         => $teamspeak::user,
    group        => $teamspeak::group,
    require      => [File[$teamspeak_dirs]],
  }
}
