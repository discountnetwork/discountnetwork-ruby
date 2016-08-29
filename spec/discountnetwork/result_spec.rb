require "spec_helper"

describe DiscountNetwork::Result do
  describe ".where" do
    it "retrieves specified search results" do
      search_id = 123_456_789
      stub_search_results_api(search_id: search_id)
      results = DiscountNetwork::Result.where(search_id: search_id)

      expect(results.current_page).to eq(1)
      expect(results.search.id).to eq(search_id)
      expect(results.hotels.first.name).to eq("Nasa Vegas Hotel")
    end
  end

  describe ".find_by" do
    it "retrieves the hotel details for a specific search" do
      search_id = 123_456_789
      hotel_id = 456_789_012
      stub_search_result_api(search_id: search_id, hotel_id: hotel_id)
      hotel = DiscountNetwork::Result.find_by(
        search_id: search_id, hotel_id: hotel_id
      )

      expect(hotel.id).to eq(hotel_id)
      expect(hotel.search.id).to eq(search_id)
      expect(hotel.name).to eq("Nasa Vegas Hotel")
    end
  end
end
