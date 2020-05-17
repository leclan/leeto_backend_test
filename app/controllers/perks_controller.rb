class PerksController < ApplicationController
  def index
    @perks = current_employee.available_perks
  end
end
