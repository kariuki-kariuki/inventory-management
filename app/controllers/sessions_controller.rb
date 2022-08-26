class SessionsController < ApplicationController
  skip_before_action :authorize, only: :create
  skip_before_action :authorize_admin, only: :create
  skip_before_action :authorize_manager, only: :create

  def create
    user = User.find_by(email: params[:email])
    # byebug
    if user && user[:password] == params[:password]
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
