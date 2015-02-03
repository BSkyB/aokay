require 'aokay'

RSpec.configure do |config|
  config.include(Aokay::Helpers)
  config.include Capybara::DSL, :type => :feature

  config.add_setting :aokay_sitecat_refs
  config.add_setting :aokay_sitecat_url

  module Aokay
    class SitecatRequest < BaseRequest
      def field_ref
        RSpec.configuration.aokay_sitecat_refs
      end

      def sitecat_url
        RSpec.configuration.aokay_sitecat_url
      end
    end
  end
end
