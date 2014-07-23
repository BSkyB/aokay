module Aokay::SiteCatHelpers

  extend RSpec::Matchers

  RSpec::Matchers.define :be_tracked do |expected|
    match do |actual|
      Aokay::SiteCatRequest.all.last.page_url.include? actual
    end
  end 

end


    #def page_should_be_tracked expected
      #eventually do 
        #SiteCatRequest.all.last.tracked_page_url.should include expected
      #end
    #end

    #def page_should_be_tracked_in_omniture expected
      #eventually do 
        #omniture_analytics_requests.last.tracked_page_url.should include expected
      #end
    #end

    #def customer_group_should_be_tracked_in_omniture expected
      #omniture_analytics_requests.last.tracked_customer_group.should include expected
    #end

    #def tracked_once_in_omniture(value, expected)
      #omniture_analytics_requests.select{ |request| 
        #request.tracked(value).include? expected if request.tracked(value)
      #}.count.should == 1
    #end
