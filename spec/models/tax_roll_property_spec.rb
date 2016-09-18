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
end
