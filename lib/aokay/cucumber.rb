require 'cucumber'
require 'aokay'

module Aokay
  class Configuration
    class << self
      attr_accessor :field_ref
      attr_accessor :sitecat_url
    end
  end

  class SitecatRequest < BaseRequest
    def field_ref
      Aokay::Configuration.field_ref
    end
    def sitecat_url
      Aokay::Configuration.sitecat_url
    end
  end
end

World(Aokay)
World(Aokay::Helpers)
World(Capybara::DSL)

After('@aokay') do
  # Clear out network traffic?
end
