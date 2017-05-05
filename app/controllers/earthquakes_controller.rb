class EarthquakesController < ApplicationController
  # start_time
  # end_time
  def index
    @earthquake_data_points = EarthquakeDataPoint.order('earthquake_date DESC').limit(10)
    # TODO validate start_time and end_time
    if params[:start_time]
      @earthquake_data_points = @earthquake_data_points.where("earthquake_date > ?", DateTime.parse(params[:start_time]))
    end

    if params[:end_time]
      @earthquake_data_points = @earthquake_data_points.where("earthquake_date < ?", DateTime.parse(params[:end_time]))
    end

    render json: {earthquake_data_points: @earthquake_data_points}
  end
end
