# Safelylaunch

Ruby client for SafelyLaunch project
This is example project made with guidance by Anton Davydov.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'safelylaunch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install safelylaunch

## Usage

### Initialization
First step: require client

```ruby
require 'safelylaunch'
```

After that you need to create connection object and use it as a client instance dependency:

```ruby
connection = Safelylaunch::HttpConnection.new(
  api_token: 'your env token', # required
  host: 'your project instance host', # optional, default 'TODO'
  logger: Logger.new, # optional, default Logger.new
  cache_time: 10 # optional, how long cache requests in seconds. If `nil` will disable cache. Default `nil`
)

client = Safelylaunch::Client.new(connection)
```

### Usage
Now we support only bool toggles without any params

```ruby
client.enable?('toggle-key') # => bool value
```

### Testing
You can use mock connection for easy testing. It will store all defined toggles in memory and use it in your code:

```ruby
connection = Safelylaunch::MockConnection.new(
  toggles: {
    'toggle-key' => true,
    'disable-toggle-key' => false,
  }
  logger: Logger.new # optional, default Logger.new
)

client = Safelylaunch::Client.new(connection)
client.enable?('toggle-key') # => true
client.enable?('disable-toggle-key') # => false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Safelylaunch project???s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/safelylaunch/ruby-client/blob/master/CODE_OF_CONDUCT.md).

## About SafelyLaunch