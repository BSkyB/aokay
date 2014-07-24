describe Aokay::BaseRequest, type: :feature do 

  describe "#all" do
    it "should return all requests" do
      visit '/'
      make_ajax_req "http://flibble.com"
      result = Aokay::BaseRequest.all
      expect(result).to be_a_kind_of(Array)
      expect(result[0]).to be_a_kind_of(Aokay::BaseRequest)
      expect(result.size).to eq(2)
    end
  end

  describe "#last" do
    it "should return all requests" do
      visit '/'
      make_ajax_req "http://flibble.com"
      result = Aokay::BaseRequest.last
      expect(result).to be_a_kind_of(Aokay::BaseRequest)
    end
  end

  describe "#host" do
    it "should return the request host" do
      visit '/'
      make_ajax_req "http://flibble.com"
      result = Aokay::BaseRequest.last
      expect(result.host).to eql "flibble.com"
    end
  end



end
