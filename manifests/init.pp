class teamspeak (
  String[1] $home,
  String[1] $user,
  String[1] $group,
  String[1] $version,
  Stdlib::HTTPUrl $teamspeak3_source_url,
  Stdlib::HTTPUrl $teamspeak6_source_url,
  Stdlib::AbsolutePath $downloads_location = "${home}/downloads",
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

  case $version {
    /^3/: {
      contain teamspeak::teamspeak3
    }
    /^6/: {
      contain teamspeak::teamspeak6
    }
    default: { fail('unsupported teamspeak version must start with 3 or 6') }
  }
}
