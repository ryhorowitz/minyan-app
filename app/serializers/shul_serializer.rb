class ShulSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :city, :state,
             :postal_code, :img

  # maybe make a custom address Serializer

  # def next_service
  #   # byebug
  #   puts 'in next service'
  #   next_service = object.services.last
  # end
end
