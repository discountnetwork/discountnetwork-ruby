module DiscountNetworkApi
  def stub_api_response(method, end_point, filename:, status: 200, data: nil)
    stub_request(method, api_end_point(end_point)).
      with(api_request_headers(data: data)).
      to_return(response_with(filename: filename, status: status))
  end

  def stub_session_create_api(login_params)
    stub_api_response(
      :post,
      "sessions",
      data: { login: login_params },
      filename: "session_created",
      status: 200
    )
  end

  def stub_search_create_api(search_params)
    stub_api_response(
      :post,
      "searches",
      data: { search: search_params},
      filename: "search_created",
      status: 200
    )
  end

  def stub_destination_list_api(term:)
    stub_api_response(
      :get,
      "destinations",
      data: { term: term },
      filename: "destinations",
      status: 200
    )
  end

  def stub_search_find_api(search_id)
    stub_api_response(
      :get,
      ["searches", search_id].join("/"),
      filename: "search",
      status: 200
    )
  end

  def stub_search_results_api(search_id:, **attributes)
    stub_api_response(
      :get,
      ["searches", search_id, "results"].join("/"),
      data: attributes,
      filename: "results",
      status: 200
    )
  end

  def stub_search_result_api(search_id:, hotel_id:)
    stub_api_response(
      :get,
      ["searches", search_id, "results", hotel_id].join("/"),
      filename: "result",
      status: 200
    )
  end

  def stub_search_booking_create_api(booking_params)
    stub_api_response(
      :post,
      "bookings",
      data: { booking: build_booking_data(booking_params) },
      filename: "booking",
      status: 200
    )
  end

  def stub_booking_find_api(booking_id)
    stub_api_response(
      :get,
      ["bookings", booking_id].join("/"),
      filename: "booking",
      status: 200
    )
  end

  def stub_account_find_api(auth_token)
    DiscountNetwork.configuration.auth_token = auth_token
    stub_api_response(
      :get,
      "account",
      filename: "user",
      status: 200,
    )
  end

  def stub_account_update_api(auth_token, attributes)
    DiscountNetwork.configuration.auth_token = auth_token
    stub_api_response(
      :put,
      "account",
      data: { subscriber: attributes },
      filename: "empty",
      status: 204,
    )
  end

  def stub_account_create_api(attributes)
    stub_api_response(
      :post,
      "account",
      data: { subscriber: attributes },
      filename: "user",
    )
  end

  def stub_activation_find_api(token)
    stub_api_response(
      :get,
      ["account", "activation", token].join("/"),
      filename: "user",
      status: 200,
    )
  end

  def stub_activation_activate_api(token, attributes)
    update_nested_account_resource(
      "activation", token, "user", user: attributes
    )
  end

  def stub_password_forgot_api(email)
    stub_api_response(
      :post,
      "account/resets",
      data: { account: { email: email } },
      filename: "empty",
      status: 204,
    )
  end

  def stub_password_create_api(token, attributes)
    update_nested_account_resource(
      "passwords", token, "empty", account: attributes
    )
  end

  def stub_password_validate_api(token)
    stub_api_response(
      :get,
      ["account", "resets", token].join("/"),
      filename: "empty",
      status: 204,
    )
  end

  def stub_supplementary_list_api
    stub_api_response(
      :get,
      "supplementaries",
      filename: "supplementaries",
      status: 200,
    )
  end

  def stub_supplementary_create_api(attributes)
    stub_api_response(
      :post,
      "supplementaries",
      data: { subscriber: attributes },
      filename: "supplementary",
      status: 200,
    )
  end

  def stub_provider_listing_api(provider_type)
    stub_api_response(
      :get,
      "providers",
      data: { type: provider_type },
      filename: "providers",
      status: 200,
    )
  end

  def stub_provider_find_by_slug_api(slug)
    stub_api_response(
      :get,
      ["providers", slug].join("/"),
      filename: "provider",
      status: 200,
    )
  end

  def stub_unauthorized_dn_api_reqeust(end_point)
    stub_request(:any, api_end_point(end_point)).
      to_return(status: 401, body: "")
  end

  def stub_unprocessable_dn_api_request(end_point)
    stub_request(:any, api_end_point(end_point)).
      to_return(status: 422, body: "")
  end

  private

  def build_booking_data(search_id:, hotel_id:, travellers:, properties:, **opt)
    opt.merge(
      search_id: search_id.to_s,
      travellers_attributes: [travellers],
      properties_attributes: [
        properties.merge(property_id: hotel_id.to_s)
      ]
    )
  end

  def update_nested_account_resource(resource, token, filename, data_hash)
    stub_api_response(
      :put,
      ["account", resource, token].join("/"),
      data: data_hash,
      filename: filename,
      status: 200,
    )
  end

  def api_end_point(end_point)
    [DiscountNetwork.configuration.api_host, end_point].join("/")
  end

  def response_with(filename:, status:)
    { body: fixture_file(filename), status: status }
  end

  def fixture_file(filename)
    file_name = [filename, "json"].join(".")
    file_path = ["../../../../", "spec", "fixtures", file_name].join("/")

    File.read(File.expand_path(file_path, __FILE__))
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
