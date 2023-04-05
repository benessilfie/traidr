class API::V1::Auth::SessionsController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])

    if @user&.authenticate(user_params[:password])
      render json: { id: @user.id, token: JsonWebToken.encode(user_id: @user.id), email: @user.email }, status: :created
    else
      head :unauthorized
    end
  end

  def destroy
    destroy_user_session
    request.headers['Authorization'] = nil
    render json: { message: 'User succesfully Logged out' }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
