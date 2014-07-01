module Aokay
  class BasicTracker

    attr_accessor :req

    def initialize req
      @req = Addressable::URI.parse req
    end

    def find_requests regex
      page.driver.network_traffic.find_all{|req| req.url =~ regex }
    end

  end
end
