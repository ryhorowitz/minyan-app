class UserServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_name, :date, :time,
             :service_shul_name, :datetime
  # :upcoming_services

  # THIS IS ALL FAKAKTA********* talk over with Ben
  def service_name
    object.service.name
  end

  def service_shul_name
    object.service.shul.name
  end

  def datetime
    object.service.datetime
  end

  def date
    object.service.date
  end

  def time
    object.service.time
  end
  # def parsed_time
  #   object.service.time.strftime('%I:%M %p')
  #         .sub('AM', 'a.m.') # sub out AM for a.m
  #         .sub('PM', 'p.m.')
  #         .gsub(/^0/, '') # gets rid of leading 0
  # end

  # def parsed_date
  #   Date.parse(object.service.date.to_s)
  #       .strftime('%a %B %e, %Y')
  # end

  # def upcoming_services
  #   return object.service.date if object.service.date > Date.today

  #   nil
  # end
end
