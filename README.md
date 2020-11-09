# puppet-teamspeak

[![Tests](https://github.com/sebastianrakel/puppet-teamspeak/workflows/tests/badge.svg)](https://github.com/sebastianrakel/puppet-teamspeak/actions?query=branch%3Aamaster+workflow%3Atests)
[![Quality](https://github.com/sebastianrakel/puppet-teamspeak/workflows/quality/badge.svg)](https://github.com/sebastianrakel/puppet-teamspeak/actions?query=branch%3Aamaster+workflow%3Aquality)
[![Puppet Forge](https://img.shields.io/puppetforge/v/sebastianrakel/teamspeak.svg)](https://forge.puppetlabs.com/sebastianrakel/teamspeak)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/sebastianrakel/teamspeak.svg)](https://forge.puppetlabs.com/sebastianrakel/teamspeak)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/sebastianrakel/teamspeak.svg)](https://forge.puppetlabs.com/sebastianrakel/teamspeak)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/sebastianrakel/teamspeak.svg)](https://forge.puppetlabs.com/sebastianrakel/teamspeak)
[![Apache 2.0_License](https://img.shields.io/github/license/sebastianrakel/puppet-teamspeak.svg)](LICENSE)

## Table of contents

* [Teamspeak Setup](#teamspeak-setup)
  * [Examples](#examples)
* [Tests](#tests)
* [Contributions](#contributions)
* [License and Author](#license-and-author)

## Teamspeak Setup

[Teamspeak](https://www.teamspeak.com/en/) is a voice over IP Server for the teamspeak 3 client

### Examples

There is no need of parameters, but there are few

```puppet
include teamspeak
```

```puppet
class{'teamspeak':
  version => '3.12.1',
  home    => '/opt/teamspeak3',
  user    => 'teamspeak',
  group   => 'teamspeak',
}
```

## Tests

This module has several unit tests and linters configured. You can execute them
by running:

```sh
bundle exec rake test
```

## Contributions

Contribution is fairly easy:

* Fork the module into your namespace
* Create a new branch
* Commit your bugfix or enhancement
* Write a test for it (maybe start with the test first)
* Create a pull request

## License and Author

This module was originally written by [Sebastian Rakel](https://github.com/sebastianrakel).
It's licensed with [Apache 2.0 License](LICENSE).
