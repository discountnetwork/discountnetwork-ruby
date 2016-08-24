module DiscountNetwork
  class Destination
    def self.list(term:)
      DiscountNetwork.get_resource(
        "destinations", term: term
      )
    end
  end
end
