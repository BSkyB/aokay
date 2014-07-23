describe Aokay::SiteCatHelpers, type: :feature do 

  describe 'expect_tracked_page' do

    include Aokay::SiteCatHelpers
  
    it "should return true if the page has been tracked" do
      visit '/'
      make_ajax_req "http://metrics.sky.com/?c9=https%3A%2F%2Fsky.com%2Ftesting"
      expect('https://sky.com/testing').to be_tracked
    end
  end
end