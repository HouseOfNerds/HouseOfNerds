# frozen_string_literal: true

require 'test_helper'

class RegistrationControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get registration_new_url
    assert_response :success
  end

  test 'should post create' do
    post registration_create_url params: { customer: {
        name: 'Hans Eriksen',
        email: 'test@examnple.com',
        address: 'Huleveien 666',
        postal_code: '1479',
        birthdate: '1970-11-25',
    } }
    assert_response :redirect
    assert_redirected_to action: :confirmation
  end

  test 'should get confirmation' do
    get registration_confirmation_url
    assert_response :success
  end
end
