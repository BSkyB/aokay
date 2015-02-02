require 'cucumber'
require 'aokay'

module Aokay
  class Configuration
    def self.field_ref=(value)
      @field_ref = value 
    end

    def self.field_ref
      @field_ref
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
