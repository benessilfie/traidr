class API::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :authorize, only: %i[update destroy]

  def show
    render json: UserSerializer.new(@user).serialized_json, status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user).serialized_json, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serialized_json, status: :ok
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize
    head :forbidden unless @user.id == current_user&.id
  end
end
