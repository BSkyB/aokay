module Aokay

  class GoogleAnalyticsRequest < BaseRequest

    def field_ref
      {
        url: 'dl'  
      }
    end

    def self.all
      BaseRequest.find_requests(/google-analytics.com\/collect/).map {|req| GoogleAnalyticsRequest.new(req.url)}
    end

    def page_should_be_tracked expected
      eventually {expect(GoogleAnalyticsRequest.all.last.tracked[:url]).to include expected}
    end
  end

end
