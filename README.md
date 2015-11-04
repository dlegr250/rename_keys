# RenameKeys

Allow renaming of Ruby hash keys, including deeply-nested keys.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rename_keys"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rename_keys

## Usage

```
# Simple renaming of keys
h = { "first" => "first value" }

h.rename_keys({ "first" => "a" })

puts h #=> { "a" => "first value" }
```

```
# Deep nesting of keys
h = { "first" => { "second" => { "third" => "third value" } } }

h.rename_keys({ "third" => "charlie" })

puts h #=> { "first" => { "second" => { "charlie" => "third value" } } }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rename_keys/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
