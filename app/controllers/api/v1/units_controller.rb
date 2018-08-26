class Api::V1::UnitsController < ApplicationController
  def index
    @units = Unit.all
    render json: @units
  end

  def show
    @unit = Unit.find(params[:id])
    render json: @unit
  end
end
