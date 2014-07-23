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

aokay allows you to make assertions on which variables or events are being sent to Omniture. aokay exposes simple methods such as `page_should_be_tracked_in_omniture page_name` which can be added to your tests.

### Cucumber

To use with Cucumber, require the following file, which exposes aokay as a Cucumber mixin.

    require 'okay/cucumber'

A step definition could look like the following:

    Then(/^page '(.+)' should be tracked in Omniture$/) do |page_name|
      page_should_be_tracked_in_omniture page_name
    end

And the corresponding scenario:

    @aokay
    Scenario: Customer creates a TV case
      Then page 'cases/new' should be tracked in Omniture`

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
