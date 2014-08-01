module Aokay
  class SitecatRequest < BaseRequest

    def matches? 
      !!(host =~ /metrics\.sky\.com/) 
    end

    def track_in_omniture(value, expected)
      omniture_analytics_requests.last.tracked(value).should include expected
    end

    def page_url
      tracked :url
    end

    def pageload?
      tracked :event and (tracked(:event).include? 'event1')
    end
  end
end
