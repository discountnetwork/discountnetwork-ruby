require "spec_helper"

describe DiscountNetwork::Response do
  describe "#parse" do
    it "parses the json content in object" do
      response = DiscountNetwork::Response.new(json_data).parse

      expect(response.data).to eq("Pong!")
      expect(response.class).to eq(DiscountNetwork::ResponseObject)
    end
  end

  def json_data
    @json_content ||= File.read("./spec/fixtures/ping.json")
  end
end
