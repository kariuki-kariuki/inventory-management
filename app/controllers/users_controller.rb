class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessed_entity
  rescue_from ActiveRecordNotFound, with: :render_not_found

  skip_before_action :authorize

  def show
    current_user = @current_user
    render json: current_user
  end

  private

  def user_params
    params.permit(:username, :password, :email, :password_confirmation)
  end

  def render_not_found
    render json: { errors: "User Not Found"}
  end

  def render_unprocessed_entity(invalid){
    render json: { errors: invalid.record.errors}, status: :unprocessable_entity
  end
  }
end
