class LeavesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_leave, only: [:destroy]

  def index
    @leaves = current_user.leaves.order("created_at desc")
  end

  def new
    @leave = current_user.leaves.build
  end

  def create
    @leave = Leave.new(leaves_params)
    respond_to do |format|
      if @leave.save
        leave_status = @leave.build_status(status: "Pending")
        leave_status.save!
        format.html { redirect_to leaves_path, notice: 'Leave successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @leave = Leave.find(params[:id])
  end

  def destroy
    @leaves = Leave.all.order("created_at desc")
    if @leave.destroy
      respond_to do |format|
        format.js { }
      end
    end
  end

  private
    def set_leave
      @leave = Leave.find_by_id(params[:id])
    end

    def leaves_params
      params.require(:leave).permit(:from_date, :to_date, :reason, :user_id,
       :status_attributes => [:status])
    end
end
