require 'simplecov'
require 'vcr'
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  VCR.configure do |config|
    config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    config.hook_into :faraday
    config.filter_sensitive_data('DONT_SHARE_MY_MAPQUEST_SECRET_KEY') { ENV['ENV_MAPQUEST_KEY'] }
    config.filter_sensitive_data('DONT_SHARE_MY_WEATHERMAP_SECRET_KEY') { ENV['ENV_WEATHERMAP_KEY'] }
    config.filter_sensitive_data('DONT_SHARE_MY_PIXABAY_SECRET_KEY') { ENV['ENV_PIXABAY_KEY'] }
    config.filter_sensitive_data('DONT_SHARE_MY_MOUNTAINPROJECT_SECRET_KEY') { ENV['ENV_MOUNTAINPROJECT_KEY'] }
    config.configure_rspec_metadata!
  end
end
