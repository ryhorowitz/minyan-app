class ShulSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :city, :state,
             :postal_code, :img
  has_many :services
end
