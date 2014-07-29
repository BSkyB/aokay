module Aokay::Helpers
  def last_sitecat_request
    Aokay::SitecatRequest.last
  end
  def last_google_analytics_request
    Aokay::GoogleAnalyticsRequest.last
  end
end
