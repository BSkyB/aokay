describe Aokay::SitecatRequest, "#find_requests", type: :feature do 

  it "should return an array of sitecat requests" do
    visit '/'
    make_ajax_req "http://metrics.sky.com"
    result = Aokay::SitecatRequest.all
    expect(result).to be_a_kind_of(Array)
    expect(result.size).to eq(1)
    expect(result.last).to be_a_kind_of(Aokay::SitecatRequest)
  end

end
