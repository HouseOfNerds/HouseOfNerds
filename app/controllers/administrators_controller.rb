# frozen_string_literal: true

class AdministratorsController < ApplicationController
  before_action :set_administrator, only: %i[show edit update destroy]

  def index
    @administrators = Administrator.order(:email).all
  end

  def show
    edit
  end

  def new
    @administrator ||= Administrator.new
    load_form_data
    render :new
  end

  def edit
    load_form_data
    render :edit
  end

  def create
    @administrator = Administrator.new(administrator_params)

    if @administrator.save
      redirect_to administrators_path, notice: 'Opprettet en ny administrator.'
    else
      new
    end
  end

  def update
    if @administrator.update(administrator_params)
      redirect_to administrators_path, notice: 'Administrator was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @administrator.destroy
    redirect_to administrators_url, notice: 'Administrator was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_administrator
    @administrator = Administrator.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def administrator_params
    params.require(:administrator).permit(:address, :birthdate, :department_id, :email, :name,
        :password_digest, :phone, :postal_code)
  end

  def load_form_data
    @departments = Department.order(:name).to_a
  end
end
