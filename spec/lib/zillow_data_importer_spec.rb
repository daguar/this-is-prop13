require 'rails_helper'

describe ZillowDataImporter do
  describe 'api key' do
    it 'initializes from secrets' do
      expect(ZillowDataImporter.new.api_key).to eq('fakekeyfortests')
    end
  end

  describe '#import_from_tax_roll_property' do
    let(:tax_roll_property) do
      create(:tax_roll_property)
    end

    before do
      allow(tax_roll_property).to receive(:cleaned_address).and_return("1427 26TH AV")

      VCR.use_cassette('zillow_deep_search') do
        @data = ZillowDataImporter.new.import_from_tax_roll_property(tax_roll_property)
      end
    end

    it 'creates a new Zillow property attached to the tax roll property' do
      expect(ZillowProperty.last.tax_roll_property).to eq(tax_roll_property)
    end

    it 'saves various location traits' do
      prop = ZillowProperty.last
      expect(prop.street_address).to eq("1427 26th Ave")
      expect(prop.city).to eq("San Francisco")
      expect(prop.zip_code).to eq(94122)
    end

    it 'saves the zestimate' do
      expect(ZillowProperty.last.zestimate).to eq(1161166)
    end
  end
end
