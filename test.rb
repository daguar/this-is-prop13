require 'rubillow'
require 'pry'

key = ENV['ZILLOW_API_KEY']

Rubillow.configure do |c|
  c.zwsid = key
end

data = Rubillow::PropertyDetails.deep_search_results(
  address: "1427 26TH AV",
  citystatezip: "San Francisco, CA"
)

binding.pry
