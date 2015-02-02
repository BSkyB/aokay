describe Aokay::Helpers, type: :feature do 

  include Aokay::Helpers

  describe "#last_sitecat_request" do
    it "should return the last sitecat request" do
      visit '/'
      make_ajax_req "http://metrics.sky.com"
      result = last_sitecat_request

      expect(result.host).to eql "metrics.sky.com"
    end

    it "should handle shorthand requests" do
      visit '/'
      make_ajax_req "http://metrics.sky.com?v18=sometestvar"
      result = last_sitecat_request

      expect(result[:testVar]).to eql "sometestvar"
    end

    it "should handle objects in the sitecat mappings" do
      visit '/'
      make_ajax_req "http://metrics.sky.com?url=metrics.sky.com&contentType20=content"
      result = last_sitecat_request

      expect(result[:url, :prop]).to eql "metrics.sky.com"
      expect(result[:contentType, :eVar]).to eql "content"
    end
  end
end
