require "spec_helper"

describe DiscountNetwork::Configuration do
  describe ".configuration" do
    it "returns the client configuraiton object" do
      api_host = "https://api.discountnetwork.io/api/v1"
      configuration = DiscountNetwork.configuration

      expect(configuration.api_host).to eq(api_host)
    end
  end

  describe "#api_key" do
    it "returns the customer specified api_key" do
      api_key = "secrect_discountnetwork_api_key"
      DiscountNetwork.configure { |config| config.api_key = api_key }

      expect(DiscountNetwork.configuration.api_key).to eq(api_key)
    end
  end
end
