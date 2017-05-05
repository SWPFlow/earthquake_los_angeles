namespace :earthquake_data do
  desc "Load the eartquake data"
  task load: :environment do
    file = File.readlines("#{Rails.root}/lib/data/all_month.csv")
    file.drop(1).each do |line|
      data_point = UsgsDataPoint.new(line.split(','))
      EarthquakeDataPoint.create(latitude: data_point.latitude,
        longitude: data_point.longitude,
        place: data_point.place,
        earthquake_date: data_point.time
      ) if data_point.felt_in_los_angeles?
    end
  end

  desc "Update the earthquake data. Run periodically latest every 24 hours"
  task update: :environment do
    connection = Faraday.new(url: "https://earthquake.usgs.gov")
    data = connection.get("/earthquakes/feed/v1.0/summary/all_day.csv")
    lines = data.body.split("\n")
    lines[1..-1].each do |line|
      data_point = UsgsDataPoint.new(line.split(','))
      # the save will fail if data point is already in the system
      EarthquakeDataPoint.create(latitude: data_point.latitude,
        longitude: data_point.longitude,
        place: data_point.place,
        earthquake_date: data_point.time
      ) if data_point.felt_in_los_angeles?
    end
  end
end
