# Only used for earthquake data points felt in Los Angeles
# despite the generic name
class EarthquakeDataPoint < ApplicationRecord
  validates_uniqueness_of :earthquake_date, scope: [:latitude, :longitude]
end
