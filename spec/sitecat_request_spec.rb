require 'spec_helper'

describe Aokay::SitecatRequest, "#find_requests", type: :feature do

  it "should return an array of sitecat requests" do
    visit '/'
    make_ajax_req "http://metrics.sky.com"
    result = Aokay::SitecatRequest.all
    expect(result).to be_a_kind_of(Array)
    expect(result.size).to eq(1)
    expect(result.last).to be_a_kind_of(Aokay::SitecatRequest)
  end

  it "should allow lookup of variables with friendly names" do
    page_name_key = RSpec.configuration.aokay_sitecat_refs[:pageName]
    url = "http://metrics.sky.com?#{page_name_key}=myPageName"

    visit '/'
    make_ajax_req url
    result = Aokay::SitecatRequest.last
    expect(result[:pageName]).to eq "myPageName"
  end
end
