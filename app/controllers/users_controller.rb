class UsersController < ApplicationController

  def monthly_attendence
    @user = User.find_by_id(params[:id])
  end
end
