require "aokay/version"

module Aokay

  def page_should_be_tracked_in_omniture expected
    Omniture.page_should_be_tracked expected
  end

  #def page_should_be_tracked_in_google expected
    #GoogleAnalyticsRequest.page_should_be_tracked expected
  #end

  #def page_should_be_tracked_by_abba expected
    #AbbaRequest.page_should_be_tracked expected
  #end

end
