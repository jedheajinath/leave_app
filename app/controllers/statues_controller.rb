class StatuesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: :StatuesController

  def index
    @leaves = Leave.all.order("created_at desc")
  end

  # def notification
  #   @leaves = Status.get_pending_leaves
  # end

  def show
  end

  def edit
    @status = Status.find(params[:id])
  end

  def destroy
    respond_to do |format|
      format.js { }
    end
  end

  def update
    @status = Status.find(params[:id])
    @status.update_attributes(status_param)
    respond_to do |format|
      format.html { redirect_to statues_index_path }
    end
  end

  def approve
    @leaves = Leave.all.order("created_at desc")
    @status = Status.find(params[:id])
    @status.status = "Approved"
    @status.save
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { }
    end
  end

  def reject
    @leaves = Leave.all.order("created_at desc")
    @status = Status.find(params[:id])
    @status.status = "Rejected"
    @status.save
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { }
    end
  end

  private
    def set_status
      @status = Status.find_by_id(params[:id])
    end

    def status_param
      params.require(:status).permit(:reason, :user_id)
    end
end
