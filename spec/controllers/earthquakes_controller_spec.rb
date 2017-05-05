require 'rails_helper'

describe EarthquakesController do
  describe 'get #index' do
    it "should render successfully" do
      get :index
      expect(response).to be_success
    end
  end
end
