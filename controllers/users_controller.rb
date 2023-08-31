class UsersController < ApplicationController
  skip_before_action :authorized, only: :create

  def show
    puts 'in show method from user_controller'
    render json: current_user
  end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  def update
    current_user.update!(user_params)
    render json: current_user, status: :ok
  end

  def destroy
    current_user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
