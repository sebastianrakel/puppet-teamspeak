class teamspeak::teamspeak3::install(
  Stdlib::HTTPUrl $source_url = $teamspeak::teamspeak3_source_url,
) {
  $archivename = "teamspeak-${teamspeak::version}.tar.bz2"
  $teamspeak_download_destination = "${teamspeak::downloads_location}/${archivename}"

  archive { $archivename:
    source       => $source_url,
    path         => $teamspeak_download_destination,
    extract      => true,
    extract_path => $teamspeak::teamspeak3::install_location,
    user         => $teamspeak::user,
    group        => $teamspeak::group,
    require      => [File[$teamspeak::downloads_location]],
  }
}
