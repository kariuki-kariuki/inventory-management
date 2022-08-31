class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


  before_action :authorize
  
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end




  def encode_token(payload)
    JWT.encode(payload, 'encryption')
  end 

  def decode_token(token)
    JWT.decode(token, 'encryption')[0]
  end 

  def authorize
    request.headers['Authorization']
  end


  def decoded_token
    if authorize

      token = authorize.split(' ')[1]

      begin
        JWT.decode(token,'encryption', true, algorithm: 'HS256')
      rescue JWT::DecoderError
        nil
      end
    end
  end 


  def current_user
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end 
  end

  def logged_in?
    !!current_user
  end 

  def authorized 
    unless logged_in?
      render json: {message: "Please Login "}, status: :unauthorized
    end 
  end















  private

  # # Authorize admin
  # def authorize_admin
  #   admin = User.find_by(id: session[:user_id])
  #   render json: { errors: ["Not authorized"] }, status: :unauthorized unless admin[:role] == 'Admin'
  # end

  # # authorize manager
  # def authorize_manager
  #   manager = User.find_by(id: session[:user_id])
  #   render json: { errors: ["Not authorized"] }, status: :unauthorized unless manager[:role] == 'Manager'
  # end

  # # authorize employee
  # def authorize
  #   @current_user = User.find_by(id: session[:user_id])

  #   render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
  # end

  # def authorize_admin
    
  # end
end
