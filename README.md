# ikasan::Client [![Build Status](https://travis-ci.org/studio3104/ikasan-client.png)](https://travis-ci.org/studio3104/ikasan-client)

post message to HipChat http gateway `ikasan`.

see: https://github.com/studio3104/ikasan

## Installation

Add this line to your application's Gemfile:

    gem 'ikasan-client', github: 'studio3104/ikasan-client'

And then execute:

    $ bundle

## Usage

#### Expamples

```ruby
require 'ikasan/client'

# ikasan server: http://localhost:4979
ikasan = ikasan::Client.new('localhost')

# ikasan server: http://localhost
ikasan = ikasan::Client.new('localhost', 80)

# use https, and not verify certificate
ikasan = ikasan::Client.new('localhost', ssl: true)

# use https, and verify default certificate
ikasan = ikasan::Client.new('localhost', ssl: true, verify_ssl: true)

# use https, and verify specified certificate
ikasan = ikasan::Client.new('localhost', ssl: true, verify_ssl: true, ca_file: '/path/to/ca_file')
```

###### send NOTICE

```ruby
ikasan.notice('#channel', 'message', color: 'random', message_format: 'text')
```

###### send PRIVMSG

```ruby
ikasan.privmsg('#chennel', 'message', color: 'random', message_format: 'text')
```

## Contributing

1. Fork it ( http://github.com/studio3104/ikasan-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
