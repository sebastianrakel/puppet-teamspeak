class teamspeak::teamspeak3::install(
  Stdlib::HTTPUrl $source_url = $teamspeak::teamspeak3_source_url,
) {
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
    source       => $source_url,
    path         => $teamspeak_download_destination,
    extract      => true,
    extract_path => $teamspeak::home,
    user         => $teamspeak::user,
    group        => $teamspeak::group,
    require      => [File[$teamspeak_dirs]],
  }
}
