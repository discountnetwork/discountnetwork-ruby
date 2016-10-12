module DiscountNetwork
  class Password < Base
    def forgot(email)
      DiscountNetwork.post_resource(
        "account/resets", account: { email: email }
      )
    end

    def create(token, attributes)
      DiscountNetwork.put_resource(
        ["account", "passwords", token].join("/"), account: attributes
      )
    end
  end
end
