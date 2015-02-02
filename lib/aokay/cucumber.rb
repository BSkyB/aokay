require 'cucumber'
require 'aokay'

module Aokay
  class Configuration
    class << self
      attr_accessor :field_ref
    end
  end

  class SitecatRequest < BaseRequest
    def field_ref
      Aokay::Configuration.field_ref
    end
  end
end

World(Aokay)
World(Aokay::Helpers)
World(Capybara::DSL)

After('@aokay') do
  # Clear out network traffic?
end
