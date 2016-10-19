require "spec_helper"

describe DiscountNetwork::Provider do
  describe ".where" do
    it "retrieve all providers for a specific type" do
      provider_type = "hotel"
      stub_provider_listing_api(provider_type)
      providers = DiscountNetwork::Provider.where(type: provider_type)

      expect(providers.count).to eq(2)
      expect(providers.first.name).not_to be_nil
      expect(providers.first.images.thumb).not_to be_nil
    end
  end
end
