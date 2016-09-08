require "spec_helper"

describe DiscountNetwork::Booking do
  describe ".create" do
    it "creates a new booking request" do
      search_id = 123_456_789
      hotel_id = 456_789_012
      booking_params = build_booking_attributes(search_id, hotel_id)
      stub_search_booking_create_api(booking_params)

      booking = DiscountNetwork::Booking.create(booking_params)
      traveller = booking.travellers.first
      property = booking.properties.first

      expect(booking.code).not_to be_nil
      expect(booking.travel_criteria.id).to eq(search_id)
      expect(property.name).to eq(property_attributes[:name])
      expect(traveller.email).to eq(traveller_attributes[:email])
    end
  end

  def build_booking_attributes(search_id, hotel_id)
    {
      search_id: search_id,
      hotel_id: hotel_id,
      travellers: traveller_attributes,
      properties: property_attributes,
      note: "This is a special requets"
    }
  end

  def traveller_attributes
    {
      first_name: "John",
      last_name: "Doe",
      phone: "012 345 6789",
      email: "john.doe@example.com",
      address: "123 Main Street",
      city: "Huai Khwang",
      state: "Bangkok",
      zip: "BK10310"
    }
  end

  def property_attributes
    {
      property_id: "property_101",
      provider_name: "Booking.com",
      name: "Nasa Vagas, Thailand",
      price: "100.99",
      description: "Description",
      review_score: "90",
      total_reviews: "10000",
      currency_code: "USD"
    }
  end
end
