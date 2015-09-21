class AttendencesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: :AttendencesController

  def index
    @users = User.where("role = 'Employee'")
  end

  # def search_daywise_attendence
  #   @users = Attendence.get_daywise_attendence(params[:date])
  # end

  def show
    @users = Attendence.get_daywise_attendence(params[:date]) if params[:date].present?
  # else @users = Attendence.get_daywise_attendence(params[:date])
  end

  def present
    @users = User.where("role = 'Employee'")
    user = User.find(params[:id])
    attendence = Attendence.where("user_id =?",params[:id]).where("attendence_date =?", Date.today).first
    if attendence.present?
      attendence.attendence = true
      attendence.save
    else
      attendence = user.attendences.build
      attendence.attendence = true
      attendence.attendence_date = Date.today
      attendence.save
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { }
    end
  end

  def absent
    @users = User.where("role = 'Employee'")
    user = User.find(params[:id])
    attendence = Attendence.where("user_id =?",params[:id]).where("attendence_date =?", Date.today).first
    if attendence.present?
      attendence.attendence = false
      attendence.save
    else
      attendence = user.attendences.build
      attendence.attendence = false
      attendence.attendence_date = Date.today
      attendence.save
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { }
    end
  end
end
