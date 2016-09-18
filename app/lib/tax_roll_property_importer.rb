require 'csv'

class TaxRollPropertyImporter
  def initialize
  end

  def import_csv(path)
    CSV.foreach(path, headers: true) do |row|
      tax_roll_property = TaxRollProperty.new(
        location_address: row["Property Location"],
        assessed_improvement_value: row["Closed Roll Assessed Improvement Value"].to_f,
        assessed_land_value: row["Closed Roll Assessed Land Value"].to_f,
        assessed_fixtures_value: row["Closed Roll Assessed Fixtures Value"].to_f,
        zip_code: row["Zipcode of Parcel"]
      )
      tax_roll_property.save
    end
  end
end
