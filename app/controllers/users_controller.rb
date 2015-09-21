class UsersController < ApplicationController

 def monthly_attendence
  @user = User.find_by_id(params[:id])
 end

 # def show
 #  if params[:date].present?
 #    @dates = params[:date].to_date.beginning_of_month..params[:date].to_date.end_of_month
 #    @attendence = current_user.get_monthly_attendence(params[:date].to_date)
 #  end
 # end

end