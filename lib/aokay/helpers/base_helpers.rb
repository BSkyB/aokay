module Aokay::BaseHelpers

  extend RSpec::Matchers

  RSpec::Matchers.define :be_tracked_as do |type| 
    match do |expected|
      @last_request = request_class.all.last
      raise "No requests made" unless @last_request
      @last_request[type] == expected
    end

    failure_message do |expected|
      "got #{@last_request[type]}"
    end
  end 

  RSpec::Matchers.define :be_tracked_once_as do |type| 
    match do |expected|
      @count = request_class.all.select{ |request| 
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

