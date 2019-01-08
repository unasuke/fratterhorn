# Fratterhorn
[![Build Status](https://travis-ci.org/unasuke/fratterhorn.svg?branch=master)](https://travis-ci.org/unasuke/fratterhorn)
[![Test Coverage](https://api.codeclimate.com/v1/badges/bcdf94958d43f2edf4ab/test_coverage)](https://codeclimate.com/github/unasuke/fratterhorn/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/bcdf94958d43f2edf4ab/maintainability)](https://codeclimate.com/github/unasuke/fratterhorn/maintainability)
[![rubygems](https://badgen.net/rubygems/v/fratterhorn)](https://rubygems.org/gems/fratterhorn)

Fratterhorn is simple frontmatter parser gem. The origin of the name is **fr**ontmatter and M**atterhorn**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fratterhorn'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fratterhorn

## Usage

```ruby
markdown = <<MD
---
title: 'how to use fratterhorn'
date: 2018-01-31 21:00 JST
tags:
- ruby
- gem
- howto
- programming
---

## What is fratterhorn?
- a gem
- parse frontmatter
MD


Fratterhorn.parse(markdown)
# => { title: 'how to use fratterhorn', date: '2018-01-31 21:00 JST', tags: ['ruby', 'gem', 'howto', 'programming'] }

Fratterhorn.parse(markdown, option: { guess: true }) # :date value is instance of a Time class
# => { title: 'how to use fratterhorn', date: 2018-01-31 21:00 JST, tags: ['ruby', 'gem', 'howto', 'programming'] }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fratterhorn.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
