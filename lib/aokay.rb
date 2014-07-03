require "aokay/version"
require "addressable/uri"
require "aokay/trackers/basic_tracker"

module Aokay

  def page_should_be_tracked_in_omniture expected
    omniture = OmnitureRequests.new(page.driver.network_traffic)
    omniture.page_should_be_tracked expected
  end

end
