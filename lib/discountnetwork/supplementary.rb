module DiscountNetwork
  class Supplementary < Base
    def list
      DiscountNetwork.get_resource(
        "supplementaries",
      ).supplementaries
    end
  end
end
