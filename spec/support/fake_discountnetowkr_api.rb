module FakeDiscountNetworkApi
  def stub_api_response(method, end_point, filename:, status: 200, data: nil)
    stub_request(method, api_end_point(end_point)).
      with(api_request_headers(data: data)).
      to_return(response_with(filename: filename, status: status))
  end

  private

  def api_end_point(end_point)
    [DiscountNetwork.configuration.api_host, end_point].join("/")
  end

  def response_with(filename:, status:)
    { body: fixture_file(filename), status: status }
  end

  def fixture_file(filename)
    File.read("./spec/fixtures/#{filename}.json")
  end

  def api_request_headers(data:)
    Hash.new.tap do |request_headers|
      request_headers[:body] = data
      request_headers[:headers] = api_authorization_headers
    end
  end

  def api_authorization_headers
    { "DN-API-KEY" => DiscountNetwork.configuration.api_key }
  end
end
