require 'aokay'

describe Aokay::BasicTracker, "#find_requests" do 
  it "should return an array of requests" do
    basic_tracker = Aokay::BasicTracker.new() 
    result = basic_tracker.find_requests(/acb/)
    result.should be_a_kind_of(Array)
  end
end
