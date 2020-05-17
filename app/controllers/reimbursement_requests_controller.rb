class ReimbursementRequestsController < ApplicationController
  before_action :fetch_perk, only: %i(new create)
  before_action :fetch_reimbursement_request, only: %i(show)

  def new
    @reimbursement_request = ReimbursementRequest.new
  end

  def create
    @reimbursement_request = ReimbursementRequest.new(reimbursement_request_params)

    if @reimbursement_request.save
      redirect_to perk_reimbursement_request_path(@perk, @reimbursement_request), notice: 'Reimbursement request was successfully created.'
    else
      render :new
    end
  end

  def show; end

  private

  def fetch_perk
    @perk = current_employee.available_perks.find(params[:perk_id])
  end

  def fetch_reimbursement_request
    @reimbursement_request = ReimbursementRequest.includes(:employee, :perk).find(params[:id])
  end

  def reimbursement_request_params
    params.require(:reimbursement_request).
      permit(:amount, :receipt).
      merge(employee_id: current_employee.id, perk_id: @perk.id)
  end
end
