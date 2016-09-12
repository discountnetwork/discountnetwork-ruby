module DiscountNetwork
  class Account < Base
    def find
      if auth_token_exists?
        DiscountNetwork.get_resource("account").user
      end
    end

    private

    def auth_token_exists?
      !DiscountNetwork.configuration.auth_token.nil?
    end
  end
end
