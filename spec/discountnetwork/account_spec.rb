require "spec_helper"

describe DiscountNetwork::Account do
  describe ".find" do
    it "returns the subscriber's profile" do
      auth_token = "ABCD_123"
      stub_account_find_api(auth_token)
      set_account_auth_token(auth_token)

      account = DiscountNetwork::Account.find(auth_token)
      set_account_auth_token(nil)

      expect(account.name).not_to be_nil
      expect(account.status).to eq("Active")
      expect(account.token).to eq(auth_token)
    end
  end

  describe ".create" do
    it "creates and returns created user" do
      stub_account_create_api(user_attributes)

      response = DiscountNetwork::Account.create(user_attributes)

      expect(response.user.name).not_to be_nil
      expect(response.user.status).to eq("Active")
    end
  end

  describe ".update" do
    it "updates the subscriber account" do
      auth_token = "ABCD_123"
      set_account_auth_token(auth_token)
      new_attributes = { first_name: "John", last_name: "Doe" }

      stub_account_update_api(auth_token, new_attributes)
      account = DiscountNetwork::Account.update(new_attributes)

      expect(account).not_to be_nil
      expect(account.class).to eq(DiscountNetwork::ResponseObject)
    end
  end

  def set_account_auth_token(token)
    DiscountNetwork.configuration.auth_token = token
  end

  def user_attributes
    @user_attributes ||= {
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
