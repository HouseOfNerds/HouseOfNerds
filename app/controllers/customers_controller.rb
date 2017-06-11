# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit image update destroy]

  def index
    @customers = Customer.order(:email).all
  end

  def show
    @asset_types = AssetType.order(:name).all
  end

  def image
    content = @customer.image_content
    content_type = @customer.image_content_type
    send_data content, filename: @customer.email.to_s, type: content_type, disposition: 'inline'
  end

  def new
    @customer = Customer.new
  end

  def edit
    render :edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:address, :birthdate, :email, :image, :name, :phone, :postal_code)
  end
end
