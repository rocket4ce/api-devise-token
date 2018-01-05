class Api::V1::SessionsController < Api::V1::ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.valid_password?(params[:password])
      render json: @user
    else
      render json: {menssage: "Tu mail o contraseña no coinciden"}
    end
  end

end
