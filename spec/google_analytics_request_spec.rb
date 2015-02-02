describe Aokay::GoogleAnalyticsRequest, "#find_requests", type: :feature do 

  it "should return an array of requests" do
    visit '/'
    make_ajax_req "http://google-analytics.com/collect"
    result = Aokay::GoogleAnalyticsRequest.all
    expect(result).to be_a_kind_of(Array)
    expect(result.size).to eq(1)
  end

end
