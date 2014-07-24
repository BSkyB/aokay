module Aokay

  class BaseRequest

    attr_accessor :req

    def initialize req
      @req = req
      @parsed_url = Addressable::URI.parse req.url
    end

    class << self

      def network_traffic
        Capybara.page.driver.network_traffic
      end

      def unfiltered_requests
        network_traffic.map{|item|self.new(item)}
      end

      def all
        unfiltered_requests.find_all {|unfiltered| unfiltered.matches? }
      end

      def last
        all.last
      end


    end

    def matches? 
      true
    end

    def host
      @parsed_url.host 
    end

    def [] key
      tracked key
    end

    def tracked key
      @parsed_url.query_values[field_ref[key]]
    end



    def hostname
      req.hostname
    end

    def [] key
      tracked key
    end

    def tracked key
      @parsed_url.query_values[field_ref[key]]
    end

  end
end
