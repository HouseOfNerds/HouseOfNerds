# frozen_string_literal: true

class AssetTypesController < ApplicationController
  before_action :set_asset_type, only: %i[show edit update destroy]

  def index
    @asset_types = AssetType.all
  end

  def show
    edit
  end

  def new
    @asset_type = AssetType.new
  end

  def edit
    render :edit
  end

  def create
    @asset_type = AssetType.new(asset_type_params)
    if @asset_type.save
      redirect_to asset_types_path, notice: 'Asset type was successfully created.'
    else
      render :new
    end
  end

  def update
    if @asset_type.update(asset_type_params)
      redirect_to asset_types_path, notice: 'Asset type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @asset_type.destroy
    redirect_to asset_types_url, notice: 'Asset type was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_asset_type
    @asset_type = AssetType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def asset_type_params
    params.require(:asset_type).permit(:name)
  end
end
