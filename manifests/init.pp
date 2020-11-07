class teamspeak (
  String[1] $source,
  String[1] $install_location,
  String[1] $user,
  String[1] $group,
) {
  contain teamspeak::install
  contain teamspeak::config
}
