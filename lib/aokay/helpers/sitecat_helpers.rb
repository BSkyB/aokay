module Aokay::SiteCatHelpers

  extend RSpec::Matchers

  RSpec::Matchers.define :be_tracked_as do |type| 
    match do |expected|
      @last_request = Aokay::SiteCatRequest.all.last
      raise "No requests made" unless @last_request
      @last_request[type] == expected
    end

    failure_message do |expected|
      "got #{@last_request[type]}"
    end
  end 

  #RSpec::Matchers.define :be_tracked_once_as do |type| 
    #match do |expected|
      ##Aokay::SiteCatRequest.all.last[type] == expected
      ##
      #Aokay::SiteCatRequest.all.select{ |request| 
        #request.tracked(value).include? expected if request.tracked(value)
      #}.count eq(1)
    #end

    #failure_message do |expected|
      #"got #{Aokay::SiteCatRequest.all.last[type]}"
    #end
  #end 
end

    #def customer_group_should_be_tracked_in_omniture expected
      #omniture_analytics_requests.last.tracked_customer_group.should include expected
    #end

