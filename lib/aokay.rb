require "aokay/version"

module Aokay
  def find_requests regex
    page.driver.network_traffic.find_all{|req| req.url =~ regex }
  end

  def find_google_requests_urls regex
    find_requests(regex).map {|req| GoogleAnalyticsRequest.new(req.url)}
  end

  def find_omniture_requests_urls regex
    find_requests(regex).map {|req| OmnitureAnalyticsRequest.new(req.url)}
  end

  def find_abba_requests_urls regex
    find_requests(regex).map {|req| AbbaRequest.new(req.url)}
  end


  def google_analytics_requests
    find_google_requests_urls /google-analytics.com\/collect/
  end

  def omniture_analytics_requests
    find_omniture_requests_urls /metrics.sky.com/
  end

  def abba_analytics_requests
    find_abba_requests_urls /abba.herokuapp.com/
  end


  def page_should_be_tracked_in_google expected
    eventually {google_analytics_requests.last.tracked_page_url.should include expected}
  end

  def page_should_be_tracked_in_omniture expected
    eventually do 
      omniture_analytics_requests.last.tracked_page_url.should include expected
    end
  end

  def customer_group_should_be_tracked_in_omniture expected
    omniture_analytics_requests.last.tracked_customer_group.should include expected
  end

  def track_in_omniture(value, expected)
    omniture_analytics_requests.last.tracked(value).should include expected
  end

  def tracked_once_in_omniture(value, expected)
    omniture_analytics_requests.select{ |request| 
      request.tracked(value).include? expected if request.tracked(value)
    }.count.should == 1
  end

  def should_be_tracked_by_abba details
    abba_query_values = abba_analytics_requests.last.req.query_values
    details.each do |key, value|
      abba_query_values[key].should eq value
    end
  end

  def should_be_marked_as_started_by_abba
    find_requests(%r{abba.herokuapp.com/start}).should_not be_empty
  end

  def should_be_marked_as_complete_by_abba
    eventually(:timeout => 10, :delay => 1) do
      find_requests(%r{abba.herokuapp.com/complete}).length.should == 1
    end
  end
end
