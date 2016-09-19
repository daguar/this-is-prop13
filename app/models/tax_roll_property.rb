class TaxRollProperty < ActiveRecord::Base
  has_one :zillow_property

  def tax_rate
    if !zillow_property
      return nil
    else
      (estimated_tax_amount / zillow_property.zestimate) * 100
    end
  end

  def cleaned_address
    index_of_first_real_character = location_address.index(/[^0\s]/)
    index_of_last_real_character = location_address.rindex(/[^0\s]/)
    location_address[index_of_first_real_character..index_of_last_real_character]
  end

  def estimated_tax_amount
    (0.011826 * (assessed_improvement_value + assessed_land_value + assessed_fixtures_value)).round(2)
  end
end
