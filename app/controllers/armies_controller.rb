class ArmiesController < ApplicationController
  def index
    @armies = Army.all
  end
end
