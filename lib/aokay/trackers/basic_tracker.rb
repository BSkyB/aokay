

module Aokay


  class BasicTracker

    attr_accessor :req

    def initialize req
      @req = Addressable::URI.parse req
    end

    def self.find_requests regex
      Capybara.page.driver.network_traffic.find_all{|req| req.url =~ regex }
    end

  end
end
