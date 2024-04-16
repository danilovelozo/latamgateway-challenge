# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  def self.has_many(field, params)
    super(field, params) do |serializer|
      if params[:decorate]
        serializer.object.send(field).to_a.map(&:decorate)
      else
        serializer.object.send(field)
      end
    end
  end
end
