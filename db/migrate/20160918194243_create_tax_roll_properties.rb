class CreateTaxRollProperties < ActiveRecord::Migration
  def change
    create_table :tax_roll_properties do |t|
      t.string :location_address
      t.float :assessed_improvement_value
      t.float :assessed_land_value
      t.float :assessed_fixtures_value
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
