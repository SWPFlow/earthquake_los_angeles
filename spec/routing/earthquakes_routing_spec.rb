require 'rails_helper'

describe "earthquakes routing" do
  it "routes index successfully" do
    expect({get: earthquakes_path}).to route_to({controller: 'earthquakes', action: 'index'})
  end
end
