RSpec.configure do |config|
  config.include(Aokay::Helpers)

  config.add_setting :aokay_sitecat_refs

  binding.pry
  
  @refs = config.aokay_sitecat_refs

  module Aokay
    class SitecatRequest < BaseRequest
      def field_ref
        #{ :yo => 't' }
        @refs
      end
    end
  end
end
