module DiscountNetwork
  class Search
    def self.create(search_params)
      DiscountNetwork.post_resource(
        "searches", search: search_params
      )
    end
  end
end
