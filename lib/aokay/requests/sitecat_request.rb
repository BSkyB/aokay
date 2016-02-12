module Aokay
  class SitecatRequest < BaseRequest

    def matches?
      !!(host =~ /#{escaped_sitecat_host}/)
    end

    def escaped_sitecat_host
      begin
        sitecat_url.gsub(/[.:\/&?]/, '\\\\\0')
      rescue
        raise "Aokay Sitecat URL not set, please set this in your configuration"
      end
    end

    def track_in_omniture(value, expected)
      omniture_analytics_requests.last.tracked(value).should include expected
    end

    def page_url
      tracked :url
    end

    def pageload?
      tracked :event and (tracked(:event).include? 'event1')
    end

    def events
      @parsed_url.query_values['events'].split(',')
    end

    def [] key, type=:eVar
      tracked key, type
    end

    def tracked key, type=:eVar
      unless field_ref
        raise "Aokay Sitecat field refs not set, please set these in your configuration"
      end

      begin
        key_sym = key.to_sym
        field = field_ref[key.to_sym]
        if field.is_a? Hash
          @parsed_url.query_values[field[type]]
        else
          super key
        end
      rescue
        raise "Aokay Sitecat field #{key.inspect} not set, please set this in your configuration"
      end
    end
  end
end
