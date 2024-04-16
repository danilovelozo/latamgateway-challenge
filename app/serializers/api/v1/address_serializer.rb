# frozen_string_literal: true

module Api
  module V1
    class AddressSerializer < ApplicationSerializer
      attributes :id, :name, :neighborhood, :city, :state, :zipcode, :full_address

      def full_address
        "#{object.name}, #{object.neighborhood}, #{object.city} - #{object.state}, #{object.zipcode}"
      end
    end
  end
end
