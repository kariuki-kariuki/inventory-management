class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessed_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  skip_before_action :authorize_admin, only: :show

  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user, status: :created
    else 
      render json: { errors: user.errors.full_message }
    end
  end

  def show
    current_user = @current_user
    render json: current_user, status: :ok
  end

  def update
    user = find_user(params[:id])
    user.update!(user_params)
    render json: user, status: :updated
  end

  def destroy
    user = find_user(params[:id])
    user.destroy
    head: no_content
  end


  private

  def find_user(id)
    User.find_by(id: id)
  end

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
