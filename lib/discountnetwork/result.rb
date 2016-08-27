module DiscountNetwork
  class Result
    def self.where(search_id:, **attributes)
      DiscountNetwork.get_resource(
        ["searches", search_id, "results"].join("/"), attributes
      ).result
    end
  end
end
