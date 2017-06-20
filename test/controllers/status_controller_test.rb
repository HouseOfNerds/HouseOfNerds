# frozen_string_literal: true

require 'test_helper'

class StatusControllerTest < ActionDispatch::IntegrationTest
  setup { login }

  test 'should get index' do
    get status_url
    assert_response :success
  end
end
