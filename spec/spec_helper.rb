require 'pry'
require 'rspec'
require 'capybara/rspec'
require "vcr"
require "webmock/rspec"

require_relative '../earning_report.rb'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
  config.configure_rspec_metadata!
  config.default_cassette_options = { record: :new_episodes }
end

Capybara.app = EarningReport
