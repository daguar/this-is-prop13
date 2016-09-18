class TaxRollProperty < ActiveRecord::Base
  def cleaned_address
    index_of_first_real_character = location_address.index(/[^0\s]/)
    index_of_last_real_character = location_address.rindex(/[^0\s]/)
    location_address[index_of_first_real_character..index_of_last_real_character]
  end
end
