# frozen_string_literal: true

require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  setup { login }

  test 'should get index' do
    get search_url
    assert_response :success
  end

  test 'search for name' do
    get search_url, params: { q: 'vegard' }
    assert_response :success
  end
end
