# frozen_string_literal: true

require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test 'get login' do
    get login_url
    assert_response :success
  end

  test 'post login' do
    post login_path, params: { email: 'vegard@example.com' }
    assert_response :success
  end

  test 'post login with external email' do
    post login_path, params: { email: 'uwe@kubosch.no' }
    assert_redirected_to login_path
  end

  test 'post login with unknown email' do
    post login_path, params: { email: 'emma@example.com' }
    assert_redirected_to login_path
  end

  test 'post login without email' do
    post login_path
    assert_redirected_to login_path
  end

  test 'logout' do
    get logout_path
    assert_redirected_to root_path
    get root_path
    assert_redirected_to login_path
  end
end
