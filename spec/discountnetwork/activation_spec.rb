require "spec_helper"

describe DiscountNetwork::Activation do
  describe ".find" do
    it "retruns the subscriber account" do
      token = "ABCD_123"
      stub_activation_find_api(token)
      account = DiscountNetwork::Activation.find(token)

      expect(account.name).not_to be_nil
      expect(account.token).to eq(token)
    end
  end
end
