class ZillowDataImporter
  def initialize
  end

  def import_from_tax_roll_property(tax_roll_property)
    data = Rubillow::PropertyDetails.deep_search_results(
      address: tax_roll_property.cleaned_address,
      citystatezip: "San Francisco, CA"
    )
    ZillowProperty.create(
      street_address: data.address[:street],
      city: data.address[:city],
      zip_code: data.address[:zipcode],
      zestimate: data.price,
      tax_roll_property: tax_roll_property
    )
  end

  def api_key
    Rubillow.configuration.zwsid
  end
end
