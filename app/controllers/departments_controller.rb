# frozen_string_literal: true

class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[show edit update destroy]

  def index
    @departments = Department.order(:name).all
  end

  def show
    edit
  end

  def new
    @department = Department.new
  end

  def edit
    render :edit
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path, notice: "Opprettet ny avdeling *#{@department.name}*"
    else
      render :new
    end
  end

  def update
    if @department.update(department_params)
      redirect_to departments_path, notice: 'Avdeling lagret.'
    else
      render :edit
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_url, notice: "Avdeling #{@department.name} er slettet."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_department
    @department = Department.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def department_params
    params.require(:department).permit(:name, :domain)
  end
end
