class ApplicationController < ActionController::API
  private

  def respond_with(handler)
    render json: handler, status: http_status(handler)
  end

  def http_status(handler)
    if handler.respond_to?(:errors) && handler.errors.present?
      :unprocessable_entity
    else
      :ok
    end
  end
end
