module Aokay
  class SitecatRequest < BaseRequest

    def matches? 
     host == "metrics.sky.com" 
    end


    def track_in_omniture(value, expected)
      omniture_analytics_requests.last.tracked(value).should include expected
    end


    def field_ref
      {
        :ab_group => 'v18',
        :section => 'c27',
        :contentType => 'c20',
        :pageName => 'pageName',
        :event => 'events',
        :url => 'c9',
        :page => 'c9',
        :link_tracking => 'c15',
        :click_event => 'event6',
        :sub_section_1 => 'c25',
        :sub_section_2 => 'c27',
        :sub_section_3 => 'c31',
        :party_id => 'c39',
        :page_load => 'event1',
        :login_complete => 'event16',
        :link_clicked => 'event6',
        :search_term => 'c1',
        :search_type => 'c12',
      }
    end

    def page_url
      tracked :url
    end

  end
end
