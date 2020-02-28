class PerksController < ApplicationController
  before_action :authenticate_user!

  # Display only active perks attached to the current user organisation
  def index
    @perks = Perk.where(
      "perks.start <= ? AND perks.end >= ? AND perks.organisation_id = ?",
      Date.today, Date.today, current_user.organisation_id
    )
  end

  # Display a specific perk
  def show
    @perk = Perk.find(params[:id])
    @perk_request = PerkRequest.new(user_id: current_user.id, perk_id: params[:id])
  end
end
