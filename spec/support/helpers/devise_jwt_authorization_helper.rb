# frozen_string_literal: true

module DeviseJwtAuthorizationHelper
  def authenticated_header(request, user)
    headers = { "Accept" => "application/json", "Content-Type" => "application/json" }
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
    request.headers.merge!(auth_headers)
  end
end
