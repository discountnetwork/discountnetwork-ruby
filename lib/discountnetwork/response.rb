require "json"

module DiscountNetwork
  class Response
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def parse
      JSON.parse(response, object_class: ResponseObject)
    end
  end

  class ResponseObject < OpenStruct; end
end
