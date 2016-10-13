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

  describe ".create" do
    it "creates a new supplementary subscriber" do
      set_account_auth_token("ABCD_123")
      stub_supplementary_create_api(supplementary_attributes)
      supplementary = DiscountNetwork::Supplementary.create(
        supplementary_attributes,
      )

      expect(supplementary).not_to be_nil
      expect(supplementary.activation_token).not_to be_nil
    end
  end

  def set_account_auth_token(token)
    DiscountNetwork.configuration.auth_token = token
  end

  def supplementary_attributes
    {
      first_name: "John",
      last_name: "Green",
      email: "john.green@example.com",
      phone: "+1 123 234 345 6789",
    }
  end
end
