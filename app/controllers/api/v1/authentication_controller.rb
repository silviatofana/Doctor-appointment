require_relative '../../../lib/json_web_token'

class Api::V1::AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { id: @user.id, token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     username: @user.name, email: @user.email, isLoggedIn: true, role: @user.role }, status: :ok
    else
      render json: { error: 'unauthorized', isLoggedIn: false, status: :unauthorized }
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
