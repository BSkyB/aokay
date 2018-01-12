module Aokay

  class BaseRequest

    attr_accessor :req

    def initialize req
      @req = req
      @parsed_url = Addressable::URI.parse req.url
    end

    # We say that requests are equal if their parameters are equal.
    # This is open to change.
    def ==(other)
      self.class == other.class && self.params == other.params
    end
    alias_method :eql?, :==

    def hash
      self.class.object_id ^ self.params.hash
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

      def cursor
        RequestCursor.new(self)
      end
    end

    # Returned by Aokay::BaseRequest.cursor.
    #
    # This class lets you wait for a request which matches a block you
    # pass it.  Separate calls to the same cursor remember the
    # requests you've already scanned, so if you call it twice with
    # the same block, you can wait for two identical messages.
    class RequestCursor
      def initialize(source)
        @source = source
        @offset = 0
      end

      # Wait for a request for which &blk returns truthy.
      # &blk may be called any number of times.
      # For example:
      #
      #   cursor = Aokay::SitecatRequest.cursor
      #
      #   make_ajax_request "http://test.host?id=1"
      #   make_ajax_request "http://test.host?id=2"
      #
      #   first,second = *(0..1).map{cursor.wait_for{|r| r.host == "test.host"}}
      #
      #   first.params['id'] # => 1
      #   second.params['id'] # => 2
      #
      # You'll get a Timeout::Error if no such request is seen within
      # `timeout_secs` seconds of making the call.
      def wait_for(timeout_secs=2, &blk)
        found = nil

        Timeout.timeout(timeout_secs) do
          # Particularly dumb implementation: just keep scanning until
          # we find something that matches.
          until found = @source.all[@offset..-1].find(&blk)
            sleep 0.1
          end
        end

        @offset = @source.all.index(found) + 1

        found
      end


    end # class RequestCursor


    def matches?
      true
    end

    def successful?
      codes = self.req.response_parts.map{|resp| resp.status}.uniq
      codes.map!{|code| code == 200}.reduce
    end

    # Here's why we need this.
    #
    #  When we ask for Capybara.page.driver.network_traffic, we can
    #  ask for the traffic before the response for the last request
    #  has been "received".  The first time you make the request, the
    #  object you get back won't have @response_parts or @error, but
    #  the *second* time, it will.
    def responded?
      self.req.response_parts.any? || self.req.error
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
      key = key.tr(' ', '_').to_sym if key.is_a? String
      field = field_ref[key]
      params && params[field]
    end

  end
end
