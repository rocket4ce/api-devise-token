class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :authenticate, only: [:show, :update, :destroy]
  before_action :set_user, only: [:show]

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render  status: 200, json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @current_user.update(user_params)
      render  status: 200, json: @user
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @current_user.destroy
    head :no_content
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
