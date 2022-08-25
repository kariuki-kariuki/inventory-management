class SessionsController < ApplicationController
  # skip_before_action :authorize, only: :create

  def create
    user = User.find_by(username: params[:username])
    # byebug
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { error: { login: 'Invalid Username or password' } }, status: :unauthorized
    end
  end

  def destroy
    session.delete :user_id
    head :no_content
  end

  private

  def user_params
    params.permit(:email,:password)
  end
end
