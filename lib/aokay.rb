require "aokay/version"
require 'aokay/trackers/base_request'
require 'aokay/trackers/google_analytics_request'
require 'aokay/trackers/sitecat_request'
require 'aokay/helpers/base_helpers'
require 'aokay/helpers/sitecat_helpers'
require 'aokay/helpers/google_analytics_helpers'
require 'wrong'

require "addressable/uri"

module Aokay

  def page_should_be_tracked_in_omniture expected
    omniture = equests.new(page.driver.network_traffic)
    omniture.page_should_be_tracked expected
  end

end
