require "spec_helper"

describe DiscountNetwork::Session do
  describe ".create" do
    it "creates a new user session" do
      stub_session_create_api(login_params)
      session = DiscountNetwork::Session.create(login_params)

      expect(session.user.token).not_to be_nil
      expect(session.user.username).to eq("username")
      expect(session.user.subscription_status).to eq("active")
    end
  end

  def login_params
    @login_params ||= { name: "username", password: "secret_passsword" }
  end
end
