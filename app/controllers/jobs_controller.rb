class JobsController < ApplicationController
  before_action :jobs, only: [:create, :update]
  def index
    @user = current_user    
    @job_list = Job.where(user_id: @user.id)      
  end

  def new    
    @job = Job.new
  end

  def create    
    @job = current_user.jobs.new(job_params)
    if @job.save
      redirect_to "/jobs"
    else
      redirect_to "/jobs", notice: "Sorry. product not saved."
    end 
  end

  private
  def job_params
    params.require(:job).permit(:user_id, :pickup_address, :dropoff_address, :pickup_lat, :pickup_long, :dropoff_lat, :dropoff_long)
  end
end
