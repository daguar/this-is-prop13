class TaxRollPropertiesController < ApplicationController
  def index
    @properties = ZillowProperty.all.includes(:tax_roll_property)
  end
end
