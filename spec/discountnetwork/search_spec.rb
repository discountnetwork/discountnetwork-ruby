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
