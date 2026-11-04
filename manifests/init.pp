class teamspeak (
  String[1] $home,
  String[1] $user,
  String[1] $group,
  String[1] $version,
  Stdlib::HTTPUrl $teamspeak_source_url,
) {
  contain teamspeak::install
  contain teamspeak::service
}
