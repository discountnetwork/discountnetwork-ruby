module DiscountNetwork
  module Session
    def self.create(name:, password:)
      DiscountNetwork.post_resource(
        "sessions", login: { name: name, password: password }
      )
    end
  end
end
