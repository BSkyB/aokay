[![Build Status](https://travis-ci.org/BSkyB/aokay.svg?branch=master)](https://travis-ci.org/BSkyB/aokay)

aokay
=====

Helps you to write tests which verify Omniture requests are made correctly.

Installation
------------

Add this line to your application's Gemfile:

    gem 'aokay'

And then execute:

    bundle

Or install it yourself as:

    gem install aokay

Usage
-----

aokay allows you to make assertions on which variables or events are being sent to Omniture. 

### RSpec

#### In spec helper file:

    require 'aokay'
    RSpec.configure do |config|

      config.aokay_sitecat_refs =
        {
            :ab_group => 'v18',
            :section => 'c27',
            :contentType => 'c20',
            :pageName => 'pageName',
            :event => 'events',
        }
    end

#### Within your specs

To check page tracking in Adobe SiteCatalyst:

`expect(last_sitecat_request[:page]).to end_with "/requests/new"`

To check the custom variable 'ab_group', which is set to eVar18 in our omniture
config. Use the following: 

`expect(last_sitecat_request[:ab_group]).to eq "testGroupAlpha"`

Dependencies
------------

You need phantomjs. Please check with your package manager.

Contributing
------------

1. Fork it ( http://github.com/<my-github-username>/aokay/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
