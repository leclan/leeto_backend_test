class PerkRequestsController < ApplicationController
  before_action :authenticate_user!

  # List all requests
  def index
    @perk_requests = PerkRequest.where(user_id: current_user.id)
  end

  # Display one request
  def show
    @perk_request = PerkRequest.find(params[:id])
  end

  # Returns a new request
  def new
    @perk_request = PerkRequest.new(user_id: current_user.id, perk_id: params[:id])
  end

  # Save the request in the DB if the request is valid
  def create
    @perk_request = PerkRequest.new(perk_request_params)
    @perk_request.user_id = current_user.id

    perk_amount_left = @perk_request.perk.amount - @perk_request.get_available_amount

    if @perk_request.invalid? || @perk_request.amount > perk_amount_left
      flash[:alert] = 'Invalid request'
      redirect_to controller: 'perks', action: 'show', id: @perk_request[:perk_id]
      return
    end

		if @perk_request.save
			redirect_to @perk_request
		else
			render 'new'
		end
  end

  private

  def perk_request_params
    params.require(:perk_request).permit(:amount, :receipt, :perk_id)
  end
end
