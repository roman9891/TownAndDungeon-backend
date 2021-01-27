class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
 
  def create
    @user = User.create(user_params)
    puts @user.id
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token, id:@user.id }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update 
    @user = User.find_by(id:params[:id])
    @user.update(user_params)
    render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
  end
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password, :progress)
  end
end
