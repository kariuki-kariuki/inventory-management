class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :authorize
  before_action :authorize_admin
  before_action :authorize_manager

  private

  # Authorize admin
  def authorize_admin
    admin = User.find_by(id: session[:user_id])
    render json: { errors: ["Not authorized"] }, status: :unauthorized unless admin[:role] == 'Admin'
  end

  # authorize manager
  def authorize_manager
    manager = User.find_by(id: session[:user_id])
    render json: { errors: ["Not authorized"] }, status: :unauthorized unless manager[:role] == 'Manager'
  end

  # authorize employee
  def authorize
    @current_user = User.find_by(id: session[:user_id])
    # byebug

    render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
