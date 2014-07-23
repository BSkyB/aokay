module Aokay

  class BaseRequest

    attr_accessor :req

    def initialize req
      @req = Addressable::URI.parse req
    end

    def self.find_requests regex
      Capybara.page.driver.network_traffic.find_all{|req| req.url =~ regex }
    end

    def [] key
      tracked key
    end

    def tracked key
      @req.query_values[field_ref[key]]
    end

  end
end
