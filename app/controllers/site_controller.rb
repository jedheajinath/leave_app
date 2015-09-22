class SiteController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  authorize_resource only: :admin_home, class: :SiteController

  def index
    if user_signed_in?
      redirect_to home_path if current_user.role == 'Employee'
      redirect_to admin_home_path if current_user.role == 'Manager'
    end
  end

  def home
    @leave = Leave.new
  end
end
