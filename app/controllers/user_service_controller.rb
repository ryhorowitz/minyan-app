class UserServiceController < ApplicationController
  def create
    user_service = UserService.create!(user_service_params)
    render json: user_service, status: :created
  end

  def destroy
    user_service = UserService.find_by(id: params[:id])
    user_service.destroy
    head :no_content
  end

  private

  def user_service_params
    params.permit(:user_id, :service_id)
  end
end
