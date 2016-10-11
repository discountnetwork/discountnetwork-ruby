require "spec_helper"

describe DiscountNetwork::Password do
  describe ".forgot" do
    it "submits a password resets request" do
      email = "john.doe@example.com"
      stub_password_forgot_api(email)
      password = DiscountNetwork::Password.forgot(email)

      expect(password).not_to be_nil
      expect(password.class).to eq(DiscountNetwork::ResponseObject)
    end
  end
end
