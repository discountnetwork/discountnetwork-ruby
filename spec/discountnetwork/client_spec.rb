require "spec_helper"

describe DiscountNetwork::Client do
  describe ".post_resource" do
    it "requests the resource via :post" do
      stub_discountnetwork_ping_request(:post, request_data)
      response = DiscountNetwork.post_resource("ping", request_data)

      expect(response.data).to eq("Pong!")
    end
  end

  def request_data
    { content: "Ping Request" }
  end

  def stub_discountnetwork_ping_request(method, data, end_point = "ping")
    stub_api_response(
      method, end_point, data: data, filename: "ping", status: 200
    )
  end
end
