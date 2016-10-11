module DiscountNetwork
  class Password < Base
    def forgot(email)
      DiscountNetwork.post_resource(
        "account/resets", account: { email: email }
      )
    end
  end
end
