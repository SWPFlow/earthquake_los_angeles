require 'rails_helper'

describe "UsgsDataPoint" do
  let :far_data_point do
    '2017-05-04T21:21:45.780Z,36.545166,-121.1063309,7.02,0.95,md,5,165,0.06321,0,nc,nc72797751,2017-05-04T21:23:23.432Z,"23km NE of Soledad, California",earthquake,0.69,2.06,0.24,3,automatic,nc,nc'.split(',')
  end

  let :close_data_point do
    '2017-05-04T19:39:08.310Z,33.7161667,-116.7511667,16.3,0.92,ml,30,111,0.03124,0.1,ci,ci37640191,2017-05-04T20:11:31.240Z,"3km SW of Idyllwild-Pine Cove, California",earthquake,0.21,0.29,0.132,17,reviewed,ci,ci'.split(',')
  end

  it "should initialize successfully with attributes" do
    point = UsgsDataPoint.new(far_data_point)
    expect(point.longitude).to eql(-121.1063309)
    expect(point.latitude).to eql(36.545166)
  end

  describe "felt_in_los_angeles?" do
    it "should return false if too far and too small" do
      point = UsgsDataPoint.new(far_data_point)
      expect(point.felt_in_los_angeles?).to be_falsey
    end

    it "should return true if close and large" do
      point = UsgsDataPoint.new(close_data_point)
      expect(point.felt_in_los_angeles?).to be_truthy
    end
  end
end
