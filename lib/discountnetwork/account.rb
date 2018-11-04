module DiscountNetwork
  class Account < Base
    def find(auth_token = nil)
      set_account_auth_token(auth_token)
      if auth_token_exists?
        DiscountNetwork.get_resource("account").user
      end
    end

    def create(attributes)
      DiscountNetwork.post_resource("account", subscriber: attributes)
    end

    def update(attributes)
      if auth_token_exists?
        DiscountNetwork.put_resource("account", subscriber: attributes)
      end
    end

    private

    def auth_token_exists?
      !DiscountNetwork.configuration.auth_token.nil?
    end

    def set_account_auth_token(auth_token)
      if !auth_token.nil?
        DiscountNetwork.configuration.auth_token = auth_token
      end
    end
  end
end
