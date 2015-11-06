# RenameKeys

Allow renaming of Ruby hash keys, including deeply-nested keys, by extending (Monkey-Patching) the Ruby core Hash class.

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

## Performance

The use case I created this gem for was retrieving small amounts of JSON from external APIs (small as in a JSON object with maybe 50-100 keys).
I do not know how performant this gem would be if you had, say, 100+ JSON objects, each with 50-100 keys, and you were changing 20+ keys at once.
If I find that performance is a big necessity, I may optimize it at that point and start doing some benchmarking.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rename_keys/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
