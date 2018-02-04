# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails' do
  minimum_coverage 85
  add_filter '/vendor/'
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

Minitest::Reporters.use!

Timecop.freeze(2017, 6, 11, 13, 37, 42)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActiveSupport::TestCase
  # set_fixture_class versions: Version
  fixtures :all

  def login
    get '/login', params: { key: administrators(:vegard).security_token }
    assert_redirected_to root_path
  end
end
