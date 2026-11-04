class teamspeak::teamspeak6::install (
  Stdlib::HTTPUrl $source_url = $teamspeak::teamspeak6_source_url,
) {
  $archivename = "teamspeak-${teamspeak::version}.tar.xz"
  $teamspeak_download_destination = "${teamspeak::downloads_location}/${archivename}"

  archive { $archivename:
    source       => $source_url,
    path         => $teamspeak_download_destination,
    extract      => true,
    extract_path => $teamspeak::teamspeak6::install_location,
    user         => $teamspeak::user,
    group        => $teamspeak::group,
    require      => [File[$teamspeak::downloads_location]],
  }
}
