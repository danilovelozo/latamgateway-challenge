# frozen_string_literal: true

require "rails_helper"

describe Api::V1::AddressSerializer, type: :model do
  describe "#as_json" do
    subject { described_class.new(address).as_json }

    let!(:user) { create :user }
    let(:address) { create :address, user: user }

    it do
      is_expected.to eq(
        id: address.id,
        name: address.name,
        neighborhood: address.neighborhood,
        city: address.city,
        state: address.state,
        zipcode: address.zipcode,
      )
    end
  end
end
