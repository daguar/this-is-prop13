class CreateZillowProperties < ActiveRecord::Migration
  def change
    create_table :zillow_properties do |t|
      t.string :street_address
      t.string :city
      t.integer :zip_code
      t.float :zestimate
      t.references :tax_roll_property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
