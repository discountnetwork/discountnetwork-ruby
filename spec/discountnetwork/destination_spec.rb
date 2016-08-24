require "spec_helper"

describe DiscountNetwork::Destination do
  describe ".list" do
    it "returns the similar destinations" do
      search_term = "bang"
      stub_destination_list_api(term: search_term)

      destinations = DiscountNetwork::Destination.list(term: search_term)
      destination = destinations.first

      expect(destination.value).to eq(835)
      expect(destination.label).to eq("Bangkok, Thailand")
    end
  end
end
