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

      def successful_requests
        unfiltered_requests.find_all do |unfiltered|
          unfiltered.matches? and unfiltered.successful?
        end
      end

      def last
        all.last
      end
    end

    def matches?
      true
    end

    def successful?
      codes = self.req.response_parts.map{|resp| resp.status}.uniq
      codes.map!{|code| code == 200}.reduce
    end

    def host
      @parsed_url.host 
    end

    def params
      @parsed_url.query_values
    end

    def hostname
      req.hostname
    end

    def [] key
      tracked key
    end

    def tracked key
      key = key.tr(' ', '_').to_sym if key.class == String
      @parsed_url.query_values[field_ref[key]]
    end

  end
end
