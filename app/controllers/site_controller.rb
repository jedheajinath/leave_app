class SiteController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    if user_signed_in?
      redirect_to home_path if current_user.role == 'Employee'
      redirect_to admin_home_path if current_user.role == 'Manager'
    end
  end

  def home
    if current_user.role == 'Employee'
      @leave = Leave.new
    else
      redirect_to admin_home_path
    end
  end

  def admin_home
    if current_user.role == 'Manager'
    else
      render text: "You are authoriserd user to access this page .."
    end
  end
end
