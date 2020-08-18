class PerksController < ApplicationController
  def index
    @perks = Perk.all
  end

  def show
    @perk = Perk.find(params.require(:id))
  end
end
