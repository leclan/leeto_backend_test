class PerksController < ApplicationController
  before_action :authenticate_employee!

  def index
    @perks = current_employee.perks
  end

  def show
    @perk = current_employee.perks.find(params.require(:id))
  end
end
