require 'pry'
class ShulsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :shul_not_found

  def index
    shuls = Shul.all
    render json: shuls, each_serializer: ShulSerializer
  end

  def show
    binding.pry
    puts 'in Shul Show route'
    shul = Shul.find_by(id: params[:id])
    render json: { message: 'hello there' }
    # shul, serializer: ShulSerializer
  end

  private

  def shul_not_found
    render json: { message: 'Shul not found' }, status: :not_found
  end
end
