# frozen_string_literal: true

require "rails_helper"

describe "Find Address by Zipcode", type: :request do
  describe "GET /api/v1/address/:zipcode" do
    let!(:user) { create :user }
    let(:headers) { {"Accept" => "application/json", "Content-Type" => "application/json"} }
    let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }

    context "when send valid data" do
      let(:zipcode) { "18076-000" }
      let!(:address) { create :address, user: user }

      it "list address" do
        get "/api/v1/address/#{zipcode}", headers: auth_headers

        formatted_response = JSON.parse(response.body)

        expect(response.status).to eq 200

        expect(formatted_response).to eq(
          {
            "id" => address.id,
            "name" => address.name,
            "neighborhood" => address.neighborhood,
            "city" => address.city,
            "state" => address.state,
            "zipcode" => address.zipcode
          }
        )
      end
    end

    context "when address does not exists" do
      let(:zipcode) { "00000-000" }

      it "show message error" do
        get "/api/v1/address/#{zipcode}", headers: auth_headers

        JSON.parse(response.body)

        expect(response.status).to eq 422
      end
    end
  end
end
