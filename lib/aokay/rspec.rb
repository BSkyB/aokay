RSpec.configure do |config|
  config.include(Aokay::Helpers)

  config.add_setting :aokay_sitecat_refs

  module Aokay
    class SitecatRequest < BaseRequest
      def field_ref
        RSpec.configuration.aokay_sitecat_refs
      end
    end
  end
end
