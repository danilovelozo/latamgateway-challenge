# frozen_string_literal: true

module Api
  module V1
    class AddressSerializer < ApplicationSerializer
      attributes :id, :name, :number, :neighborhood, :city, :state
    end
  end
end
