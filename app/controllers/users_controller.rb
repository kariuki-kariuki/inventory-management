class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessed_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found


  # skip_before_action :authorize, only[:]
  def create
    user = User.create!(user_params)
      session[:user_id] = user.id
      render json: user, status: :created
  end

  # show route
  def show
    render json: @current_user, status: :ok
  end

  # Update route
  def update
    user = find_user
    user.update!(user_params)
    render json: user, status: :updated
  end

  # destroy route
  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
  end


  private

  def find_user
    User.find_by(id: session[:id])
  end

  def user_params
    params.permit(:name,:email,:password,:role)
  end

  def render_not_found
    render json: { errors: "User Not Found"}
  end

  def render_unprocessed_entity(invalid)
    render json: { message: invalid.record.errors}, status: :unprocessable_entity
  end
end
