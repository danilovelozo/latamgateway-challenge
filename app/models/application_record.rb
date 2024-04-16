# frozen_string_literal: true

class UnprocessableEntityError < StandardError; end

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.build_enum_hash(array)
    array.each_with_object({}) { |k, obj| obj[k] = k }
  end
end
