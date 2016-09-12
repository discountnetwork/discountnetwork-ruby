require "spec_helper"

describe DiscountNetwork::Account do
  describe ".find" do
    it "returns the subscriber's profile" do
      auth_token = "ABCD_123"
      stub_account_find_api(auth_token)
      set_account_auth_token(auth_token)

      account = DiscountNetwork::Account.find
      set_account_auth_token(nil)

      expect(account.name).not_to be_nil
      expect(account.status).to eq("Active")
      expect(account.token).to eq(auth_token)
    end
  end

  def set_account_auth_token(token)
    DiscountNetwork.configuration.auth_token = token
  end
end
