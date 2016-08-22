require "rest-client"
require "discountnetwork/response"
require "discountnetwork/configuration"

module DiscountNetwork
  class Client
    attr_reader :http_method, :end_point, :attributes

    def initialize(http_method, end_point, attributes = {})
      @http_method = http_method
      @end_point = end_point
      @attributes = attributes
    end

    def execute
      Response.new(execute_api_request).parse
    end

    private

    def execute_api_request
      RestClient::Request.execute(
        method: http_method,
        url: api_end_point,
        payload: attributes,
        headers: custom_headers
      )
    end

    def api_end_point
      [DiscountNetwork.configuration.api_host, end_point].join("/")
    end

    def custom_headers
      {
        "DN-API-KEY" => DiscountNetwork.configuration.api_key,
        "Authorization" =>
        "Token token=\"#{DiscountNetwork.configuration.auth_token}\""
      }
    end
  end

  def self.post_resource(end_point, attributes)
    Client.new(:post, end_point, attributes).execute
  end
end
