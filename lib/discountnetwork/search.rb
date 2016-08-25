module DiscountNetwork
  class Search
    def self.create(search_params)
      DiscountNetwork.post_resource(
        "searches", search: search_params
      )
    end

    def self.find(search_id)
      DiscountNetwork.get_resource(
        ["searches", search_id].join("/")
      ).search
    end
  end
end
