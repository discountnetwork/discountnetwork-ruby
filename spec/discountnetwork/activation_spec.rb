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

  describe ".activate" do
    it "activates the subscriber account" do
      token = "ABCD_123"
      stub_activation_activate_api(token, subscriber_attributes)
      account = DiscountNetwork::Activation.activate(
        token, subscriber_attributes
      )

      expect(account.name).not_to be_nil
      expect(account.status).to eq("Active")
    end
  end

  def subscriber_attributes
    @subscriber_attributes ||= {
      first_name: "John",
      last_name: "Doe",
      sex: "Male",
      address: "123 Main Street",
      city: "New York",
      zip: "NY123",
      state: "New York",
      phone: "+1 123 456 789 0123",
      mobile: "+1 012 345 678 9012",
      username: "john.doe",
      email: "john.doe@example.com",
      country: "US",
      password: "secret_password",
      password_confirmation: "secret_password",
    }
  end
end
