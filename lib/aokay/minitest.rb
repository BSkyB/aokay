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
