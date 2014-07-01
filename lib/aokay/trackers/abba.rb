module Aokay
  class Abba < BasicTracker
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

    def find_abba_requests_urls regex
      find_requests(regex).map {|req| AbbaRequest.new(req.url)}
    end

    def abba_analytics_requests
      find_abba_requests_urls /abba.herokuapp.com/
    end
  end
end
