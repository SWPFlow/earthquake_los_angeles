require 'rails_helper'

RSpec.describe EarthquakeDataPoint, type: :model do
  describe "validations" do

    it "should be unique on earthquake_date and latitude and longitude" do
      point = FactoryGirl.create(:earthquake_data_point)
      duplicated_point = FactoryGirl.build(:earthquake_data_point)
      expect(duplicated_point).to_not be_valid
    end
  end
end
