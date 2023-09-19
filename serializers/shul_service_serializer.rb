class ShulServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :city,
             :state, :postal_code, :img, :next_service
  # has_many :services

  def next_service
    byebug
    puts 'in next service'
    object.services.last
  end
end
