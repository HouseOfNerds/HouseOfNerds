# frozen_string_literal: true

require 'test_helper'

class AdministratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrator = administrators(:one)
  end

  test 'should get index' do
    get administrators_url
    assert_response :success
  end

  test 'should get new' do
    get new_administrator_url
    assert_response :success
  end

  test 'should create administrator' do
    assert_difference('Administrator.count') do
      post administrators_url, params: { administrator: { address: @administrator.address, birthdate: @administrator.birthdate, email: @administrator.email, name: @administrator.name, password_digest: @administrator.password_digest, phone: @administrator.phone, postal_code: @administrator.postal_code } }
    end

    assert_redirected_to administrator_url(Administrator.last)
  end

  test 'should show administrator' do
    get administrator_url(@administrator)
    assert_response :success
  end

  test 'should get edit' do
    get edit_administrator_url(@administrator)
    assert_response :success
  end

  test 'should update administrator' do
    patch administrator_url(@administrator), params: { administrator: { address: @administrator.address, birthdate: @administrator.birthdate, email: @administrator.email, name: @administrator.name, password_digest: @administrator.password_digest, phone: @administrator.phone, postal_code: @administrator.postal_code } }
    assert_redirected_to administrator_url(@administrator)
  end

  test 'should destroy administrator' do
    assert_difference('Administrator.count', -1) do
      delete administrator_url(@administrator)
    end

    assert_redirected_to administrators_url
  end
end
