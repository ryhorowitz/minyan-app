module SharedSerializerMethods
  extend ActiveSupport::Concern

  def parsed_time
    object.time.strftime('%I:%M %p')
          .sub('AM', 'a.m.') # sub out AM for a.m
          .sub('PM', 'p.m.')
          .gsub(/^0/, '') # gets rid of leading 0
  end

  def parsed_date
    Date.parse(object.date.to_s)
        .strftime('%a %B %e, %Y')
  end
end
