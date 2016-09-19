class ZillowDataImporter
  def initialize
  end

  def import_from_tax_roll_property(tax_roll_property)
    return if tax_roll_property.zillow_property

    data = Rubillow::PropertyDetails.deep_search_results(
      address: tax_roll_property.cleaned_address,
      citystatezip: "San Francisco, CA"
    )
    if data.success?
      ZillowProperty.create(
        street_address: data.address[:street],
        city: data.address[:city],
        zip_code: data.address[:zipcode],
        zestimate: data.price,
        tax_roll_property: tax_roll_property
      )
    else
      binding.pry
    end
  end

  def api_key
    Rubillow.configuration.zwsid
  end
end
