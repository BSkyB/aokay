module Aokay
  class OmnitureRequests < BasicTracker

    def page_should_be_tracked expected
      eventually do 
        Omniture.all.last.tracked_page_url.should include expected
      end
    end

    private #-------------------------------------------------------->

    def self.all
      find_requests(/metrics.sky.com/).map {|req| Omniture.new(req.url)}
    end

    def page_should_be_tracked_in_omniture expected
      eventually do 
        omniture_analytics_requests.last.tracked_page_url.should include expected
      end
    end

    def customer_group_should_be_tracked_in_omniture expected
      omniture_analytics_requests.last.tracked_customer_group.should include expected
    end

    def track_in_omniture(value, expected)
      omniture_analytics_requests.last.tracked(value).should include expected
    end

    def tracked_once_in_omniture(value, expected)
      omniture_analytics_requests.select{ |request| 
        request.tracked(value).include? expected if request.tracked(value)
      }.count.should == 1
    end

    def sitecat_mapping
      {
        'ab_group' => 'v18',
        'section' => 'c27',
        'step 3 section' => 'c31',
        'contentType' => 'c20',
        'pageName' => 'pageName',
        'event' => 'events',
        'url' => 'c9',
        'link_tracking' => 'c15',
        'click_event' => 'event6',
        'sub_section_1' => 'c25',
        'sub_section_2' => 'c27',
        'sub_section_3' => 'c31',
        'party_id' => 'c39',
        'page_load' => 'event1',
        'login_complete' => 'event16',
        'link_clicked' => 'event6',
        'search_term' => 'c1',
        'search_type' => 'c12',
        'livechatAvailability' => 'c50'
      }
    end

    def tracked_page_url
      @req.query_values[sitecat_mapping['url']]
    end

    def tracked(value)
      @req.query_values[sitecat_mapping[value]]
    end

    def tracked_customer_group
      @req.query_values[sitecat_mapping['ab_group']]
    end
  end
end
