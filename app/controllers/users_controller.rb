class UsersController < ApplicationController
  skip_before_action :authenticate_request

  def register
    @user = User.new(user_params)

    if @user.save
      token = JsonWebToken.encode(user_id: @user.id)

      render json: { auth_token: token }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:nickname, :email, :password)
  end
end
