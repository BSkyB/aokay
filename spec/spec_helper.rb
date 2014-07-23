require 'pry'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'support/blank_rack'
require 'aokay'

Capybara.default_driver = :poltergeist
Capybara.app = BlankRack.new

RSpec.configure do |config|
end
