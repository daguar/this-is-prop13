require 'rails_helper'

describe TaxRollPropertyImporter do
  describe '#import_csv' do
    let(:csv_path) { File.expand_path('../../fixtures/secured_property_tax_roll_single_row.csv', __FILE__) }

    before do
      TaxRollPropertyImporter.new.import_csv(csv_path)
    end

    it 'creates a property' do
      expect(TaxRollProperty.count).to eq(1)
    end

    it 'saves the location address' do
      expect(TaxRollProperty.last.location_address).to eq("0000 0342 26TH                AV0000")
    end

    it 'saves the assessed improvement value' do
      expect(TaxRollProperty.last.assessed_improvement_value).to eq(103927)
    end

    it 'saves the assessed land value' do
      expect(TaxRollProperty.last.assessed_land_value).to eq(185902)
    end

    it 'saves the assessed land value' do
      expect(TaxRollProperty.last.assessed_fixtures_value).to eq(0)
    end

    it 'saves the zip code' do
      expect(TaxRollProperty.last.zip_code).to eq(94121)
    end
  end
end
