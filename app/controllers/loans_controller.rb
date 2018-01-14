# frozen_string_literal: true

class LoansController < ApplicationController
  before_action :set_loan, only: %i[show edit update return destroy]

  def index
    loan_query = Loan.includes(:customer, :asset_type)
    loan_query_today = loan_query.today
    @outstanding_loans = loan_query.outstanding.order(:created_at).all
    @returned_loans = loan_query_today.returned.order(returned_at: :desc).all
    @loans_yesterday = loan_query.yesterday.all
  end

  def show
    edit
  end

  def new
    @loan ||= Loan.new
    load_form_data
    render :new
  end

  def edit
    load_form_data
    render :edit
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      redirect_to @loan.customer, notice: 'Loan was successfully created.'
    else
      new
    end
  end

  def update
    if @loan.update(loan_params)
      redirect_to @loan, notice: 'Loan was successfully updated.'
    else
      render :edit
    end
  end

  def return
    @loan.update! returned_at: Time.current
    redirect_to @loan.customer
  end

  def destroy
    @loan.destroy
    redirect_to @loan.customer, notice: 'Slettet utlånet.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_loan
    @loan = Loan.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def loan_params
    params.require(:loan).permit(:customer_id, :asset_type_id, :returned_at)
  end

  def load_form_data
    @customers = Customer.all
    @asset_types = AssetType.all
  end
end
