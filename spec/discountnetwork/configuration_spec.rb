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

  describe "#auth_token" do
    it "returns the user authentication token" do
      auth_token = "user_secret_authentication_token"
      DiscountNetwork.configure { |config| config.auth_token = auth_token }

      expect(DiscountNetwork.configuration.auth_token).to eq(auth_token)
    end
  end
end
