# frozen_string_literal: true

class RegistrationController < ApplicationController
  skip_before_action :require_login

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.verified = false

    if @customer.save
      redirect_to :registration_confirmation
    else
      render :new
    end
  end

  def confirmation; end

  private def customer_params
    params.require(:customer).permit(:address, :birthdate, :email, :image, :name,
        :phone, :postal_code)
  end
end
