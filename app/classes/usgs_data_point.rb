# A class that represents a USGS data point.
# Takes in an array of attributes
class UsgsDataPoint
  LOS_ANGELES_LATITUDE = 34.052235
  LOS_ANGELES_LONGITUDE = -118.243683

  attr_accessor :time, :latitude, :longitude, :magnitude, :place

  def initialize(attributes=[])
    @latitude, @longitude = attributes[1].to_f, attributes[2].to_f
    @magnitude = attributes[4].to_f
    @place = attributes[13]
    @time = attributes[0]
  end

  def felt_in_los_angeles?
    distance = Haversine.distance(LOS_ANGELES_LATITUDE, LOS_ANGELES_LONGITUDE, latitude, longitude)
    @magnitude*100.0 >= distance.to_miles
  end
end
