module Aokay
  class SitecatRequest < BaseRequest

    def matches? 
      !!(host =~ /metrics\.sky\.com/) 
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

    def tracked key, type=:eVar
      if field_ref[key].is_a? Hash
        @parsed_url.query_values[field_ref[key][type]]
      else
        super
      end
    end

    private #----------------------------------------------


  end
end
