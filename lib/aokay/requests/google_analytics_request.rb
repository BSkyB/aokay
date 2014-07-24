module Aokay

  class GoogleAnalyticsRequest < BaseRequest

    def field_ref
      {
        url: 'dl'  
      }
    end

    def matches? 
      host == "google-analytics.com"
    end

    def page_should_be_tracked expected
      eventually {expect(GoogleAnalyticsRequest.all.last.tracked[:url]).to include expected}
    end
  end

end
