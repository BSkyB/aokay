describe Aokay::GoogleAnalyticsHelpers, type: :feature do 

  describe 'expect_tracked_page' do

    include Aokay::GoogleAnalyticsHelpers
  
    it "should return true if the page has been tracked" do
      visit '/'
      make_ajax_req "https://www.google-analytics.com/collect?dl=https%3A%2F%2Fsky.com%2Ftesting"
      expect('https://sky.com/testing').to be_tracked_as :url
    end

    it "should an error if nothing has been tracked" do
      visit '/'
      expect {expect('https://sky.com/testing/something').to be_tracked_as :url}.to raise_error
    end

    it "should return false if the incorrect page was tracked" do
      visit '/'
      make_ajax_req "https://www.google-analytics.com/collect?dl=https%3A%2F%2Fsky.com%2Ftesting"
      expect {expect('https://sky.com/testing/something').to be_tracked_as :url}.to raise_error
    end

    it "should return true if a page has only been tracked once" do
      visit '/'
      make_ajax_req "https://www.google-analytics.com/collect?dl=https%3A%2F%2Fsky.com%2Ftesting"
      expect('https://sky.com/testing').to be_tracked_once_as :url
    end

    it "should return false if a page has been tracked more than once" do
      visit '/'
      make_ajax_req "https://www.google-analytics.com/collect?dl=https%3A%2F%2Fsky.com%2Ftesting"
      make_ajax_req "https://www.google-analytics.com/collect?dl=https%3A%2F%2Fsky.com%2Ftesting"
      expect {expect('https://sky.com/testing').to be_tracked_once_as :url}.to raise_error
    end
  end
end
