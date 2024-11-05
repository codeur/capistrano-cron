# Capistrano::Cron

The gem is based on Whenever code. The difference is that crontab file is generated and uploaded to the server during deployment.
No bin/whenever is needed on the server. It handles well asdf too.

## Installation

TODO: Replace `capistrano-cron` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add capistrano-cron

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install capistrano-cron

In your Capfile, require the library:

```ruby
require 'capistrano/cron'
install_plugin Capistrano::Cron
```

## Usage

```sh
cap <stage> cron:update
cap <stage> cron:clear
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/capistrano-cron. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/capistrano-cron/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Capistrano::Cron project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/capistrano-cron/blob/main/CODE_OF_CONDUCT.md).
