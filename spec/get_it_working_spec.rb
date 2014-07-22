describe Aokay::BasicTracker, "#find_requests", type: :feature do 
  it "should return an array of requests" do
    visit '/'
    result = Aokay::BasicTracker.find_requests(/acb/)
    expect(result).to be_a_kind_of(Array)
  end
end
