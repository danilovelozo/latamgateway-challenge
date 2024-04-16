# frozen_string_literal: true

module Api
  module V1
    class AddressSerializer < ApplicationSerializer
      attributes :id, :name, :neighborhood, :city, :state, :zipcode
    end
  end
end
