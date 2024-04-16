# frozen_string_literal: true

class Address
  class FindByZipcodeService
    class << self
      def perform!(params, user)
        address = user&.addresses&.find_by(zipcode: format_zipcode(params[:zipcode]))

        return address if address

        fetch_address(format_zipcode(params[:zipcode]), user)
      end

      private

      def fetch_address(zipcode, user)
        @url = "https://viacep.com.br/ws/#{zipcode}/json/"

        @request = HTTParty.get(@url, headers: { "Content-Type" => "application/json" })

        @result = JSON.parse(@request.body)

        return nil unless @result["logradouro"].present?

        create_address!(@result, user)
      end

      def create_address!(result, user)
        Address.create!(
          name: @result["logradouro"],
          neighborhood: @result["bairro"],
          city: @result["localidade"],
          state: @result["uf"],
          zipcode: format_zipcode(@result["cep"]),
          user_id: user.id,
        )
      end

      def format_zipcode(zipcode)
        zipcode.delete("^a-zA-Z0-9")
      end
    end
  end
end
