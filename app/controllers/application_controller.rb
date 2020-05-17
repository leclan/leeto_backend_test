class ApplicationController < ActionController::Base
  before_action :require_authenticated_employee

  helper_method :current_employee

  def current_employee
    if session[:employee_id]
      @current_employee ||= Employee.find(session[:employee_id])
    else
      @current_employee = nil
    end
  end

  def require_authenticated_employee
    return if current_employee
    render 'sessions/new', status: :unauthorized
  end
end
