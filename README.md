# RailsCookieOverflow

Rails raises a CookieOverflow exception when the total size of the incoming request's cookie crosses a certain threshold - currently set as 4096 bytes. While it is not advisable to store or pass around such large data in cookies, sometimes, bad actors can try to send large cookie payloads to your application to see if your systems are able to handle it. If not handled, your application would end up raising a large number of 500 exceptions. This gem handles the exception gracefully and responds with a [422 Unprocessable Entity](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/422).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_cookie_overflow'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rails_cookie_overflow

And the rest is automatically taken care of.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_cookie_overflow. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rails_cookie_overflow/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsCookieOverflow project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_cookie_overflow/blob/master/CODE_OF_CONDUCT.md).
