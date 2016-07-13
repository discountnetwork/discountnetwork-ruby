# Discount Network

[![Build
Status](https://travis-ci.org/discountnetwork/discountnetwork-ruby.svg?branch=master)](https://travis-ci.org/discountnetwork/discountnetwork-ruby)
[![Code
Climate](https://codeclimate.com/github/discountnetwork/discountnetwork-ruby/badges/gpa.svg)](https://codeclimate.com/github/discountnetwork/discountnetwork-ruby)

Ruby API client for Discount Network API

## Installation

Add this line to your application's Gemfile:

```ruby
gem "discountnetwork", github: "discountnetwork/discountnetwork-ruby"
```

And then execute:

```sh
$ bundle
```

## Configure

Once you have your API keys from Discount Network, then you can add an initializer
to set up your API keys

```ruby
DiscountNetwork.configure do |config|
  config.api_key = "YOUR_API_KEY"

  # Default configurations
  # config.api_host = "https://api.discountnetwork.io/v1"
end
```

## Development

We are following Sandi Metz's Rules for this gem, you can read the
[description of the rules here]
(http://robots.thoughtbot.com/post/50655960596/sandi-metz-rules-for-developers). All new code should follow these rules. If you make changes in a pre-existing
file that violates these rules you should fix the violations as part of
your contribution.

### Setup

* Clone the repository.

```sh
git clone https://github.com/discountnetwork/discountnetwork-ruby.git
```

* Setup your environment.

```sh
bin/setup
```

* Run the test suite

```sh
bin/rake
```

### PlayBox

* Setup API keys.

```sh
cp .sample.pryrc .pryrc
vim .pryrc
```

* Start your console.

```sh
bin/console
```

* Start playing with it.

```sh
DiscountNetwork::Session.create(name: "username", password: "password")
```

## Contributing

First, thank you for contributing! We love pull requests from everyone. By
participating in this project, you hereby grant the right to grant or transfer
an unlimited number of non exclusive licenses or sub-licenses to third parties,
under the copyright covering the contribution to use the contribution by all
means.

Here are a few technical guidelines to follow:

1. Open an [issue][issues] to discuss a new feature.
1. Write tests to support your new feature.
1. Make sure the entire test suite passes locally and on CI.
1. Open a Pull Request.
1. [Squash your commits][squash] after receiving feedback.
1. Party!

[issues]: https://github.com/discountnetwork/discountnetwork-ruby/issues
[squash]: https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
