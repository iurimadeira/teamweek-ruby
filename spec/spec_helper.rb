require 'teamweek-ruby'
require 'teamweek/api/test/http_client'
require 'webmock/rspec'
require 'vcr'
require 'timecop'

Dir[File.join('spec/support/**/*.rb')].each { |f| require "./#{f}" }

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.ignore_localhost = true
  config.before_record do |interaction|
    interaction.response.decompress if interaction.response.compressed?
  end
end

RSpec.configure do |config|
  config.order = "random"
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
