class SessionsController < ApplicationController
<<<<<<< HEAD
=======
  skip_before_action :authorized, only: [:create]
>>>>>>> 6e5143e (actin cable setup)

  # def create
  #   user = User.find_by(email: params[:email])
  #   # byebug
<<<<<<< HEAD
  #   if user && user[:password] == params[:password]
  #     session[:user_id] = user.id
  #     byebug
  #     render json: user, status: :created
  #   else
  #     render json: { error: { login: 'Invalid Username or password' } }, status: :unauthorized
  #   end
  # end

  # def destroy
  #   session.delete :user_id
  #   head :no_content
  # end
  before_action :authorize, except: [:create]


  def show
    render json: @current_user, status: :ok
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { jwt: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                     name: @user.name, email: @user.email, role: @user.role }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
=======
  #   if user&.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     render json: user, status: :created
  #   else
  #     render json: { error: { login: 'Invalid Email or password' } }, status: :unauthorized
  #   end
  # end



  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: { user: @user, jwt: token}, status: :accepted
    else
      invalid_record
    end 

  end 
>>>>>>> 6e5143e (actin cable setup)



  private

  def user_params
    params.permit(:email,:password)
  end


  def invalid_record
    render json: {message: "Invalid username or Password"}, status: :unauthorized
  end 
end
