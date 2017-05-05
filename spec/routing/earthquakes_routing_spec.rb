require 'rails_helper'

describe "earthquakes routing" do
  it "should route index to earthquakes" do
    expect({get: '/'}).to route_to({controller: 'earthquakes', action: 'index'})
  end

  it "routes index successfully" do
    expect({get: earthquakes_path}).to route_to({controller: 'earthquakes', action: 'index'})
  end
end
