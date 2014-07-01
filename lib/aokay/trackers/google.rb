module Aokay

  class Google < BasicTracker
    def google_analytics_requests
      find_google_requests_urls /google-analytics.com\/collect/
    end

    def tracked_page_url
      @req.query_values['dl']
    end

    def find_google_requests_urls regex
      find_requests(regex).map {|req| GoogleAnalyticsRequest.new(req.url)}
    end

    def page_should_be_tracked expected
      eventually {google_analytics_requests.last.tracked_page_url.should include expected}
    end
  end

end
