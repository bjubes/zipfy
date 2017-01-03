# Zipfy ![Build Status](https://travis-ci.org/bjubes/zipfy.svg?branch=master)

Zipfy calculates word distribution in text files or strings and their deviation from Zipf's law"

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zipfy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zipfy

## Usage

Instanciate an instance of the class `Zipf` and use its instance methods, or just run Zipfy via the command line
`zipfy file_to_analyze.txt -v`

use `zipfy --help` for all possible arguments.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bjubes/zipfy. Please ensure all pull requests are compatible with the license.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

