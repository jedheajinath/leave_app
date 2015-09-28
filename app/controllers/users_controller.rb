class UsersController < ApplicationController
  def monthly_attendence
    @user = User.find_by_id(params[:id])
    @attendence =  @user.get_monthly_attendence
    @leaves_day = @user.get_leaves_for_attendence
  end
end
