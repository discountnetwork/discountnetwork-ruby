module DiscountNetwork
  class Activation < Base
    def find(token)
      DiscountNetwork.get_resource(
        ["account", "activation", token].join("/"),
      ).user
    end

    def activate(token, attributes)
      DiscountNetwork.put_resource(
        ["account", "activation", token].join("/"), user: attributes
      ).user
    end
  end
end
