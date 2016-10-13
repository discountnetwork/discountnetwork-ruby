require "spec_helper"

describe DiscountNetwork::Supplementary do
  describe ".list" do
    it "lists the supplementaries for authenticated subscriber" do
      set_account_auth_token("ABCD_123")
      stub_supplementary_list_api
      supplementaries = DiscountNetwork::Supplementary.list

      expect(supplementaries.count).to eq(1)
      expect(supplementaries.first.name).to eq("Mrs. Doe")
    end
  end

  def set_account_auth_token(token)
    DiscountNetwork.configuration.auth_token = token
  end
end
