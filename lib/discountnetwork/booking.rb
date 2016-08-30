module DiscountNetwork
  class Booking < Base
    def create(search_id:, hotel_id:, travellers:, properties:, **attrs)
      attributes = attrs.merge(
        search_id: search_id,
        travellers_attributes: build_array_params(travellers),
        properties_attributes: build_array_params(
          properties.merge(property_id: hotel_id)
        )
      )

      DiscountNetwork.post_resource(
        "bookings", booking: attributes
      ).travel_request
    end
  end
end
