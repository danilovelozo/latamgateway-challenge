# frozen_string_literal: true

module Api
  module V1
    class AddressesController < ApplicationController
      before_action :authenticate_user!

      def find_address_by_zipcode
        ::Address::FindByZipcodeService
          .perform!(params, current_user)
          .then { validate_result(_1) }
      end

      private

      def validate_result(result)
        return render json: { errors: "Address Not Found" }, status: :unprocessable_entity if result.nil?

        render json: result, status: :ok, serializer: AddressSerializer
      end
    end
  end
end
