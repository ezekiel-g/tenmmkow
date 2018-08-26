class Api::V1::ArmiesController < ApplicationController
  def index
    @armies = Army.all
    render json: @armies
  end

  def show
    @army = Army.find(params[:id])
    render json: @army
  end
end
