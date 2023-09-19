class ShulsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :shul_not_found

  def index
    shuls = Shul.all
    render json: shuls, status: :ok
  end

  def show
    byebug
    puts 'in Shul Show route'
    shul = Shul.find_by(id: params[:id])
    render json: shul, serializer: ShulServiceSerializer
  end

  private

  def shul_not_found
    render json: { message: 'Shul not found' }, status: :not_found
  end
end
