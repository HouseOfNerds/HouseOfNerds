# frozen_string_literal: true

require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @loan = loans(:one)
  end

  test 'should get index' do
    get loans_url
    assert_response :success
  end

  test 'should get new' do
    get new_loan_url
    assert_response :success
  end

  test 'should create loan' do
    assert_difference('Loan.count') do
      post loans_url, params: { loan: { asset_type_id: @loan.asset_type_id, customer_id: @loan.customer_id, returned_at: @loan.returned_at } }
    end

    assert_redirected_to customer_url(Loan.last.customer)
  end

  test 'should show loan' do
    get loan_url(@loan)
    assert_response :success
  end

  test 'should get edit' do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test 'should update loan' do
    patch loan_url(@loan), params: { loan: { asset_type_id: @loan.asset_type_id, customer_id: @loan.customer_id, returned_at: @loan.returned_at } }
    assert_redirected_to loan_url(@loan)
  end

  test 'should destroy loan' do
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to @loan.customer
  end
end
