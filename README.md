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

## Usages

### Session

Session API allow you to authenticate a subscriber, create a new session or
destroying an existing session.

#### Create a new session

Creating a new session will verify the subscriber and return the `subscriber`
object with subscription details.

```ruby
DiscountNetwork::Session.create(
  name: "username", password: "secret_password"
)
```

### Account

#### Find user account

Once you have created a new session and store the token as `auth_token`
configuration then you can retrieve the user account details as

```ruby
#
# It expectes you to set up the `auth_token` configuration
# before requesting the user account API. If you have not
# set up the the `auth_token` yet then you can use
#
# `DiscountNetwork.configuration.auth_token = session_token

DiscountNetwork::Account.find
```

### Destination

#### List destinations

Retrieve the list of destinations based on a search term. This is useful when
you are planning to show the list of destinations while user start to type
destination name

```ruby
DiscountNetwork::Destination.list(term: "bangkok")
```

### Search

#### Create new search

You can create a new search using the API. Please note: It's advisable to wait
10-15 seconds before trying to retrieve the search results.

```ruby
DiscountNetwork::Search.create(
  adults: 2,
  children: 0,
  room_numbers: 1
  location_id: 835,
  check_in: "25/10/2016",
  check_out: "28/10/2016",
  location_name: "Bangkok, Thailand",
)
```

#### Retrieve search details

Once, you have created a new search and you have the search id then you can
retrieve the search details as

```ruby
DiscountNetwork::Search.find(search_id)
```

### Result

#### Retrieve search results

Retrieve the hotel search results from the Discount Network API.

```ruby
DiscountNetwork::Result.where(
  search_id: search_id
)
```

#### Retrieve a hotel details

Retrieve the hotel details for a specific search

```ruby
DiscountNetwork::Result.find_by(
  search_id: search_id, hotel_id: hotel_id
)
```

### Booking

#### Creating a new booking

Submit a new booking request for a specific hotel using the API.

```ruby
# Creating a new booking request for a specific hotel, Pay close
# attention to the construction of the booking object
#
# If you want to add multiple travellers in one booking then
# pass an Array for travellers as
# `travellers: [traveller_one_attributes, traveller_two_attributes]`
#
# If you need to add multiple properties in one request, like one
# hotel and a condo in one booking request, then pass an Array as
#`properties: [property_one_attributes, property_two_attributes]`

DiscountNetwork::Booking.create(
  hotel_id: "hotel_id",
  search_id: "search_id",
  travellers: traveller_attributes,
  properties: property_attributes
)

# Traveller attributes

traveller_attributes = {
  first_name: "John",
  last_name: "Doe",
  phone: "012 345 6789",
  email: "john.doe@example.com",
  address: "123 Main Street",
  city: "New York",
  state: "New York",
  zip: "NY10310"
}

# Property attributes

property_attributes = {
  property_id: "property_101",
  provider_name: "Booking.com",
  name: "Nasa Vagas, Thailand",
  price: "100.99",
  description: "Description",
  review_score: "90",
  total_reviews: "10000",
  currency_code: "USD"
}
```

### Find a booking

To find the details for a specific booking request, including the confirmation
number, use

```ruby
DiscountNetwork::Booking.find(booking_id)
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

## Testing

### RSpec

This gem provides an easier way to test Discount Network API Responses. Simply
include the following line in your `spec_helper` and you should have access to
all of the test helpers.

```ruby
require "discountnetwork/rspec"
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
