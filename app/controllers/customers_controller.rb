# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit image save_image update destroy]

  def index
    @customers = Customer.without_images.order(:email).all
  end

  def show
    @asset_types = AssetType.order(:name).all
    @loan_history = @customer.loans.older.to_a
  end

  def image
    content = @customer.image_content
    content_type = @customer.image_content_type
    send_data content, filename: @customer.email.to_s, type: content_type, disposition: 'inline'
  end

  def save_image
    params.require(:imgBase64) =~ /^data:([^;]+);base64,(.*)$/
    content = Base64.decode64($2)
    content_type = $1
    @customer.update! image_content: content, image_content_type: content_type
    render plain: content.hash
  end

  def new
    @customer = Customer.new
  end

  def edit
    render :edit
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.verified = true

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
    params.require(:customer).permit(:address, :birthdate, :email, :image, :name,
        :parental_approval, :phone, :postal_code)
  end
end
