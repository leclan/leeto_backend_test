class PerkRequestsController < ApplicationController
  before_action :authenticate_user!
  # def _new
  #   puts "perk request params: #{params}"
  #   # @perk_request = PerkRequest.new(user_id: current_user.id, perk_id: params.id)
  #   # @perk_request = PerkRequest.new
  #   @perk_request = current_user.perk_requests.build
  # end

  def index
    @perk_requests = PerkRequest.where(user_id: current_user.id)
  end

  def show
    @perk_request = PerkRequest.find(params[:id])
  end

  def new
    @perk_request = PerkRequest.new(user_id: current_user.id, perk_id: params[:id])
  end

  def create
    @perk_request = PerkRequest.new(perk_request_params)
    @perk_request.user_id = current_user.id

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
