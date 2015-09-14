class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to error_path
  end

  protected
    def layout_by_resource
      if user_signed_in? && current_user.role == "Employee"
        'employee'
      elsif user_signed_in? && current_user.role == "Manager"
        'manager'
      else
        'application'
      end
    end
end
