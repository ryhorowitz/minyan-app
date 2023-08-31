class ShulSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :city, :state, :postal_code, :img
  # maybe make a custom address Serializer
end
