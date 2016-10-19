module DiscountNetwork
  class Provider < Base
    def where(type:)
      DiscountNetwork.get_resource(
        "providers", type: type
      ).providers
    end

    def find_by_slug(slug)
      DiscountNetwork.get_resource(
        ["providers", slug].join("/"),
      ).provider
    end
  end
end
