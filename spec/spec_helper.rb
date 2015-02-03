require 'pry'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'support/blank_rack'
require 'aokay/rspec'

Capybara.default_driver = :poltergeist
Capybara.app = BlankRack.new

RSpec.configure do |config|
  config.aokay_sitecat_refs =
    {
      :testVar => 'v18',
      :testProp => 'c27',
      :complex_name_here => 'c20',
      :pageName => 'pageName',
      :event => 'events',
      :pageLoad => 'event1',
      :contentType => {prop: 'contentType',eVar: 'contentType20'},
      :url => {prop: 'url',eVar: 'url9'}
    }
    config.aokay_sitecat_url = 'metrics.sky.com'
end

def make_ajax_req url
  script = <<-JAVASCRIPT
    var oReq = new XMLHttpRequest();
    oReq.open("get", "#{url}", true);
    oReq.send();
  JAVASCRIPT
  page.driver.execute_script script
end
