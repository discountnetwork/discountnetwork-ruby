require "webmock/rspec"
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "discountnetwork"

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  config.include FakeDiscountNetworkApi

  config.before :all do
    DiscountNetwork.configure do |discountnetwork_config|
      discountnetwork_config.api_key = "SECRET_API_KEY"
    end
  end
end
