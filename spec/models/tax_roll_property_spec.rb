require 'rails_helper'

RSpec.describe TaxRollProperty, type: :model do
  describe '#cleaned_address' do
    let(:property) do
      TaxRollProperty.new(location_address: raw_address)
    end

    context 'with an address with extraneous zeroes at the beginning' do
      let(:raw_address) { "0000 0143 JUDSON AV0000" }

      it 'removes them' do
        expect(property.cleaned_address).to eq("143 JUDSON AV")
      end
    end
  end

  describe '#estimated_tax_amount' do
    let(:property) do
      create(:tax_roll_property,
        assessed_improvement_value: 100000,
        assessed_land_value: 200000,
        assessed_fixtures_value: 20000
      )
    end

    it 'is 1.1826% of the sum of all the asssesed values' do
      expect(property.estimated_tax_amount).to eq(3784.32)
    end
  end
end
