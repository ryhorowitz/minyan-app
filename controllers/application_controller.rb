class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authorized
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def authorized
    return render json: { error: 'Not authorized' }, status: :unauthorized unless session.include? :user_id
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def current_user
    return nil unless session[:user_id]

    user = User.find(session[:user_id])
  end
end
