class ReimbursementRequestsController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_perk

  def new
    @reimbursement_request = ReimbursementRequest.new
  end

  def create
    @reimbursement_request = ReimbursementRequest.new(reimbursement_request_params)
    @reimbursement_request.perk = @perk
    @reimbursement_request.employee = current_employee

    if @reimbursement_request.save
      redirect_to(perks_path, notice: t('.created_successfully'))
    end
  end

  private

  def set_perk
    @perk = current_employee.perks.find(params.require(:perk_id))
  end

  def reimbursement_request_params
    params.require(:reimbursement_request).permit(:amount, :receipt)
  end
end
