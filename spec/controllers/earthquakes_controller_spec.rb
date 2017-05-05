require 'rails_helper'

describe EarthquakesController do
  let :earthquake_data_point do
    FactoryGirl.create(:earthquake_data_point)
  end

  describe 'get #index' do
    before :each do
      earthquake_data_point
    end

    it "should render successfully" do
      get :index
      expect(response).to be_success
    end

    it "should have earthquake_data_points" do
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['earthquake_data_points']).to_not be_blank
    end

    context "EarthquakeDataPoints" do
      it "should only grab ones with earthquake_dates > start_time" do
        FactoryGirl.create(:earthquake_data_point, earthquake_date: 1.day.ago)

        get :index, params: {start_time: 2.days.ago.to_s}
        parsed_body = JSON.parse(response.body)
        expect(parsed_body['earthquake_data_points']).to_not be_empty
        parsed_body['earthquake_data_points'].each do |data_point|
          expect(DateTime.parse(data_point['earthquake_date']) > 2.days.ago ).to be_truthy
        end
      end

      it "should only grab ones with earthquake_dates < end_time" do
        FactoryGirl.create(:earthquake_data_point, earthquake_date: 4.days.ago)
        get :index, params: {end_time: 3.days.ago.to_s}
        parsed_body = JSON.parse(response.body)
        expect(parsed_body['earthquake_data_points']).to_not be_empty
        parsed_body['earthquake_data_points'].each do |data_point|
          expect(DateTime.parse(data_point['earthquake_date']) < 3.days.ago).to be_truthy
        end
      end
    end
  end
end
