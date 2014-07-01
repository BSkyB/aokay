module Aokay

  class GoogleAnalyticsRequest < AnalyticsRequest
    def tracked_page_url
      @req.query_values['dl']
    end
  end

end
