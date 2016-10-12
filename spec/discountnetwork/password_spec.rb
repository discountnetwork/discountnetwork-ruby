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

  describe ".create" do
    it "creates a new password" do
      token = "ABCD_123"
      password_attributes = {
        password: "secret_password",
        password_confirmation: "secret_password",
      }

      stub_password_create_api(token, password_attributes)
      password = DiscountNetwork::Password.create(token, password_attributes)

      expect(password).not_to be_nil
      expect(password.class).to eq(DiscountNetwork::ResponseObject)
    end
  end

  describe ".validate" do
    it "valides the password reset token" do
      token = "ABCD_123"
      stub_password_validate_api(token)
      password = DiscountNetwork::Password.validate(token)

      expect(password).not_to be_nil
      expect(password.class).to eq(DiscountNetwork::ResponseObject)
    end
  end
end
