require "spec_helper"

describe DiscountNetwork::Search do
  describe ".create" do
    it "creates a new search" do
      stub_search_create_api(search_params)
      search = DiscountNetwork::Search.create(search_params)

      expect(search.search.id).not_to be_nil
      expect(search.search.wait_time).to be > 5
      expect(search.search.location).to eq(search_params[:location_name])
    end
  end

  describe ".find" do
    it "finds the specified search" do
      search_id = "DN_SEARCH_101"
      stub_search_find_api(search_id)
      search = DiscountNetwork::Search.find(search_id)

      expect(search.id).to eq(search_id)
      expect(search.location).to eq("Bangkok, Thailand")
    end
  end

  def search_params
    @search_params ||= {
      location_id: "835",
      location_name: "Bangkok, Thailand",
      check_in: "25/08/2016",
      check_out: "28/08/2016",
      adults: "2",
      children: "0",
      room_numbers: "1"
    }
  end
end
