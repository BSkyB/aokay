describe Aokay::Helpers, type: :feature do 

  describe "#last_sitecat_request" do
    it "should return the last sitecat request" do
      visit '/'
      make_ajax_req "http://metrics.sky.com"
      binding.pry
      result = last_sitecat_request
      expect(result.host).to eql "metrics.sky.com"
    end
  end



end
