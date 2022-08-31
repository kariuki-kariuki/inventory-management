class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  

  def show
    render json: @current_user, status: :ok
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { jwt: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                     id: @user.id,name: @user.name, email: @user.email, role: @user.role }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
 



  

  private

  def user_params
    params.permit(:email,:password)
  end


  def invalid_record
    render json: {message: "Invalid username or Password"}, status: :unauthorized
  end 
end
