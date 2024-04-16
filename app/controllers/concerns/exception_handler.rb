# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError,
      with: :render_internal_server_error

    rescue_from UnprocessableEntityError,
      with: :render_unprocessable_entity_error

    rescue_from ActiveRecord::RecordNotFound,
      with: :render_record_not_found

    rescue_from ActiveRecord::RecordInvalid,
      with: :render_record_invalid

    rescue_from ActionController::ParameterMissing,
      with: :render_parameter_missing

    rescue_from ActiveModel::ValidationError,
      with: :render_validation_error
  end

  private

  def render_unprocessable_entity_error(error)
    render_errors([error.message], :unprocessable_entity)
  end

  def render_internal_server_error(error)
    return head :internal_server_error if Rails.env.production?

    render_errors([[error.message, error.backtrace.first].join(": ")], :internal_server_error)
  end

  def render_record_not_found
    head :not_found
  end

  def render_unauthorized
    head :unauthorized
  end

  def render_record_invalid(error)
    render_errors(
      error.record.errors.full_messages,
      :unprocessable_entity,
      capitalized_messages(error.record.errors.messages)
    )
  end

  def render_parameter_missing(error)
    render_errors([error.message], :unprocessable_entity)
  end

  def render_validation_error(error)
    render_errors(error.model.errors.full_messages, :unprocessable_entity)
  end

  def render_errors(messages, status, fields = {})
    render json: {errors: {fields: fields, messages: messages}}, status: status
  end

  def capitalized_messages(errors)
    errors.each_with_object({}) { |key, obj| obj[key.first] = key.second.map(&:capitalize) }
  end
end
