module DiscountNetwork
  class Activation < Base
    def find(token)
      DiscountNetwork.get_resource(
        ["account", "activation", token].join("/"),
      ).user
    end
  end
end
