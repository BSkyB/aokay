module Aokay
  class AnalyticsRequest
    attr_accessor :req
    def initialize req
      @req = Addressable::URI.parse req
    end
  end
end
