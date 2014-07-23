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

  RSpec::Matchers.define :be_tracked_once_as do |type| 
    match do |expected|
      @count = Aokay::SiteCatRequest.all.select{ |request| 
        request[type].include?(expected) unless request[type].nil?
      }.count
     @count == 1
    end

    failure_message do |expected|
      "Expecting #{expected} #{name_to_sentence}. Saw #{@count} requests"
    end
  end 
end

    #def customer_group_should_be_tracked_in_omniture expected
      #omniture_analytics_requests.last.tracked_customer_group.should include expected
    #end

