module DiscountNetwork
  class Supplementary < Base
    def list
      DiscountNetwork.get_resource(
        "supplementaries",
      ).supplementaries
    end

    def create(attributes)
      DiscountNetwork.post_resource(
        "supplementaries", subscriber: attributes
      )
    end
  end
end
