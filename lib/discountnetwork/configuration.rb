module DiscountNetwork
  class Configuration
    attr_accessor :api_host, :api_key

    def initialize
      @api_host ||= "https://api.discountnetwork.io/api/v1"
    end
  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
