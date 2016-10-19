module DiscountNetwork
  class Provider < Base
    def where(type:)
      DiscountNetwork.get_resource(
        "providers", type: type
      ).providers
    end
  end
end
