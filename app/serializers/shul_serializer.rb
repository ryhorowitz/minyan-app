class ShulSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :city, :state,
             :postal_code, :img
  has_many :services
  # custom scope of last three services can;t figure out
  # do
  # def last_three_serviceszzz
  #   object.services.first
  # en
  # end

  # maybe make a custom address Serializer

  # def next_service
  #   # byebug
  #   puts 'in next service'
  #   next_service = object.services.last
  #   next_service[:formated_time] = '7:15'
  # end

  # def parsed_time
  #   object.time.strftime('%I:%M %p')
  #         .sub('AM', 'a.m.') # sub out AM for a.m
  #         .sub('PM', 'p.m.')
  #         .gsub(/^0/, '') # gets rid of leading 0
  # end

  # def parsed_date
  #   Date.parse(object.date.to_s)
  #       .strftime('%a %B %e, %Y')
  # end
end
