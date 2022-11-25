class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    if User.find(name: user_params[:name])
      render json: { error: 'Username already exists, please login or use another username to sign up' },
             status: :unauthorized
    else
      @user = User.create(user_params)
      render json: { message: 'User created correctly.' }, status: :ok
    end
  end

  def login
    if User.find(name: user_params[:name])
      render json: { message: 'User created correctly.' }, status: :ok
    else
      render json: { error: 'Username does not exists, please sign up' }, status: :not_found
    end
  end
end
